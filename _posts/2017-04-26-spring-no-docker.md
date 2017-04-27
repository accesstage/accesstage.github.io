---
layout: post
title:  Spring no Docker!
date:   2017-04-26 11:00:00
author: leonardotonin
---

### Projeto de exemplo

Quando decidimos migrar para uma arquitetura *open-source* com micro-serviços alguns *frameworks* e ferramentas vieram imediatamente à tona.

A idéia em seu formato de barro significava micro-serviços feitos com Spring Boot isolados de alguma forma e gerenciados da maneira mais automática e transparente possível.

Em puco tempo a escolha do *Docker* como forma de container para garantir o isolamente veio de forma natural. Bem como sua orquestração, a qual optamos pelo uso do *Kubernetes*.

A escolha do Spring Boot foi evoluida para o Spring Cloud, que no mundo dos micro-serviços parece fazer todo o sentido devido a sua gama de ferramentas integradas (service discovery, circuit breakers e etc.).

Desenhos foram feitos e slides foram apresentados. E as equipes de desenvolvimento sentiram a necessidade de algo "palpável" por assim dizer, onde todos os conceitos abstratos apresentados começassem a ser apresentados em forma de código. O qual todos pudessem analisar e aprender juntos.

Comparilharemos aqui o projeto simplório que criamos como POC/Referência. Sem o objetivo de ser totalitário no que tange a razão, mas para servir de base, guia, inspiração e aprendizado. 

### Disclaimer

Nesse exemplo não nos aprofundaremos no Spring Cloud ou na arquitetura de micro-serviços. Para esses assuntos aguardem os próximos posts. Por enquanto, esperamos que vocês apreciem como fizemos para isolar nosso projeto no Docker e como organizamos o uso do Spring e do Maven.

### Para os impacientes

Você encontra o projeto de exemplo o qual comentaremos a seguir, no link: [Spring-Cloud-With-Docker-Example](https://github.com/accesstage/Spring-Cloud-With-Docker-Example). 

> Por favor fiquem a vontade para realizar *Fork's* ou sugerir melhorias \o/

### O pom pai

Esse post e esse exemplo não são sobre o *Maven*, mas sempre vale ser caprichoso com essa ferramenta fantástica. Afinal o objetivo do projeto é servir de exemplo. E comentando e discutindo mesmo os mais experiêntes aprendem. Então vamos à alguns pontos:

Listamos no pom do projeto pai todos os projetos filhos como módulos:
> A descrição de cada módulo pode ser encontrada [aqui](https://github.com/accesstage/Spring-Cloud-With-Docker-Example#modules)

```bash
<modules>
    <module>example-domain</module>
    <module>example-repository</module>
    <module>example-service</module>
    <module>example-api</module>
    <module>example-application</module>
    <module>example-web</module>
</modules>
```

E em cada projeto filho declaramos o projeto pai como *parent*

```bash
<parent>
    <artifactId>example</artifactId>
    <groupId>com.company</groupId>
    <version>1.0-SNAPSHOT</version>
</parent>	
```

Isso garante inicialmente um bom funcionamenteo do *distributionManagement*, assegura que as versões dos módulos filhos acompanham a versão do pai, facilitam a compreenção humana do projeto e principalmente: Permite o uso de *dependencyManagement*. Onde os módulos filhos devem evitar conter em seus pom's as versões de suas dependências. Mas sim usar a versão definida no pom pai, previnindo disparidade de versões entre os módulos.

No *dependencyManagement* também é possível declarar as versões dos próprios módulos, facilitando as dependências entre eles na hora do desenvolvimento:

```bash
<dependencyManagement>
    <dependencies>
        <!-- INTERNAL -->
        <dependency>
            <groupId>com.company</groupId>
            <artifactId>example-domain</artifactId>
            <version>${project.version}</version>
        </dependency>
        <dependency>
            <groupId>com.company</groupId>
            <artifactId>example-repository</artifactId>
            <version>${project.version}</version>
        </dependency>
        .
        .
        .

        <!-- EXTERNAL -->
        <!-- LOMBOK -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>${lombok.version}</version>
        </dependency>
        .
        .
        .
    </dependencies>
</dependencyManagement>
```

E no pom filho:
```bash
<dependencies>
    <!-- INTERNAL -->
    <dependency>
        <groupId>com.company</groupId>
        <artifactId>example-domain</artifactId>
    </dependency>

    <!-- EXTERNAL -->
    <!-- SPRING -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-mongodb</artifactId>
    </dependency>
</dependencies>
```


E não é porque estamos isolando as versões em um único pom que a organização precisa por ai. Não devemos espalhar números por todo o xml, podemos isolar todas as versões como *properties*. Deixando o arquivo mais legível:

```bash
<properties>
    <!-- JAVA VERSION -->
    <java.version>1.8</java.version>

    <!-- SPRING BOOT VERSION -->
    <spring-boot.version>1.5.2.RELEASE</spring-boot.version>
    .
    .
    .
    <!-- MAVEN DOCKER PLUGIN VERSION -->
    <docker-maven-plugin.version>0.4.13</docker-maven-plugin.version>
</properties>
```

### É cedo para se assustar com as nuvens da primavera

Muitos estão familiarizados com o difundido Spring Boot e o receio de ter que reaprender o Sping (mais uma vez... rsrsr) surge no coração dos jovens padawans.

Não é preciso. Pois no primeiro momento as aplicações simples podem muito bem continuar usando o Spring Boot. O Spring Cloud não vem para subistituir o Spring Boot mas sim para te-lo como complemento. 

Então podemos deixar Hystrix, Eureka e companhia para posts e exemplos futuros. Pois são ferramentas que merecem ser estudadas em mais profundidade do que cabe nesse momento.

Entretanto faz todo o sentido deixar o projeto exemplo preparado para trabalhar com tudo que o Spring Cloud tem a oferecer. Assim sai o *BOM* ([bill of materials](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html#Importing_Dependencies)) do Spring Boot e entra o do Spring Cloud:

```bash
!-- BOM -->
<!-- SPRING -->
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-dependencies</artifactId>
    <version>${spring-cloud.version}</version>
    <type>pom</type>
    <scope>import</scope>
</dependency>
```

E o Spring Boot passa a ser importado comoo *parent*:


```bash
!-- BOM -->
<!-- SPRING -->
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>1.5.2.RELEASE</version>
</parent>
```
> Cuidado ao tentar usar um *properties* como versão de um *parent*. Não funciona.


### Mas afinal e o Docker?

Isolar o projeto seja ele micro-serviço ou não em um container, significa que ele não deve conhecer a máquina host. 

De maneira objetiva subir um Docker manualmente (um que satisfaça a aplicação), adicionar o projeto dentro dele, logar no Docker e iniciar a aplicação, cumpre o propósito.

Mas não é nem de longe prático ou elegante. Já imaginou ter que fazer isso todas as vezes que precisar de um release? E adivinha aonde a comunidade Java decidiu resolver o problema?

Surgem então alguns plugins para Maven que prometem facilitar esse trabalho. O que escolhemos usar é o do [Spotfy](https://github.com/spotify/docker-maven-plugin) . 

Seu uso não é complexo. Mas alguma falta de material e exemplos sobre, nos fez gastar algum tempo para aplica-lo da forma como queriamos.


#### Nem só de música vive o homem, mas de plugins também!

O ciclo de vida do plugin é bem simples. No momendo do empacotamento o plugin gerará a imagem definida no Dockerfile que deverá estar dentro do diretório "docker" na aplicação. Por sua vez, a aplicação já construida será adicionada a imagem de forma automática. Passando a fazer parte da imagem final.

Para isso o plugin deve ser usado no pom do módulo que de fato gera o pacote executável e distribuível. Podendo assim enxerga-lo e copia-lo.
No caso do nosso projeto fazendo uso do Spring Boot o .jar final é gerado no módulo [example-application](https://github.com/accesstage/Spring-Cloud-With-Docker-Example/tree/master/example-application). Sendo assim é no pom dele que configuramos o plugin:

```bash
<plugin>
    <groupId>com.spotify</groupId>
    <artifactId>docker-maven-plugin</artifactId>
    <configuration>
        <skipDockerBuild>false</skipDockerBuild>
        <imageName>spring-cloud-example</imageName>
        <dockerDirectory>${docker-maven-plugin.dockerDirectory}</dockerDirectory>
        <resources>
            <resource>
                <targetPath>/</targetPath>
                <directory>${project.build.directory}</directory>
                <include>${project.build.finalName}.jar</include>
            </resource>
        </resources>
    </configuration>
</plugin>
```

Essa configuração enxerga o Dockerfile localizado no diretório src/main/docker/ do módulo e não do projeto pai. Cheque seu conteúdo a seguir:

```bash
FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD example-application-1.0-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
```
Em "FROM" definimos qual imagem base do Docker queremos que o plugin use. Não precisa ser uma imagem especial para o plugin. O mais importante é ela satisfazer os requisitos da sua aplicação.
Escolhemos usar a [alpine-oraclejdk8](https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/) por ser enxuta e fazer uso da implementação do Oracle JDK ao invés do OpenJDK.

Como fica claro, em "ADD" copiamos o nosso pacote dentro da imagem com o nome "app.jar". E em "ENTRYPOINT" garantimos a execução da aplicação ao subir o Docker.

Vale mencionar que esse Dockerfile também não tem nada especifíco do plugin. Podendo conter mais ou menos comandos e parâmetros comuns de qualquer [Dockerfile](https://docs.docker.com/engine/reference/builder/). Permitindo um bom nível de costumização e liberdade na construção da imagem.

Como não queriamos usar o plugin no projéto pai, precisamos avisar isso ao Maven. Afinal o pom do projeto pai tem prioridade em relação aos módulos na sequencia de execução do Maven.

```bash
<!-- DOCKER COMPILER PLUGIN -->
<plugin>
    <groupId>com.spotify</groupId>
    <artifactId>docker-maven-plugin</artifactId>
    <configuration>
        <skipDockerBuild>true</skipDockerBuild>
    </configuration>
</plugin>
```

### Vendo acontecer

O comando Maven para o plugin criar a imagem é usado na *goal* de empacotamento. Contúdo o pacote já deve estar instalado. Dessa forma a sequencia correta para o funcionamento é:

```bash
$ mvn clean install
```

```bash
$ mvn package docker:build
```

> Muito provavelmente a sua instalação do docker é pro usuário Root, por tanto será preciso executar os comandos do Maven com *sudo*

Após a execução do empacotamento a imagem final com a aplicação isolada já está criada e mais: está adicionada às imagens da sua instalção do docker!

Você pode verificar através do comando:
```bash
$ sudo docker images
```

Por ultimo, tendo recuperado o nome da imagem, você pode subi-la normalmente:

```bash
$ sudo docker run -p 8080:8080 -i -t <<IMAGE ID>>
```
Basta acessar http://localhost:8080 e conferir o resultado!

Esperamos que esse trabalho ajude a todos os interessados em saber mais sobre aplicações Java isoladas de forma prática em containers. 
Obrigado e até os próximos posts! \o/
