---
layout: post
title:  Ferramentas de Apoio!
date:   2017-04-04 20:07:00
author: rodrigomelgar
---

### Git - Nexus - Jenkins
Após o incio a estratégia da empresa de migrar do SVN para o Git, leia mais aqui no post do  [@leo](http://engenharia.accesstage.com.br/2017/03/15/do-svn-ao-git.html) conseguimos um servidor novinho em folha, com 4GB de RAM e 2 vcpu e instalamos o centOS nele.


### Instalações


* GitLab Ce

* Jenkins

* Nexus

Mostraremos um how-to-do que permite que qualquer pessoa possa executar um. Consideramos interessante escrever esse material pois existe pouca coisa em portugues, e acreditamos que esse blog pode alcancar um público maior, deixando os posts em português.

### GitLab-CE

```bash
Estamos utilizando o CentOS 7

yum install gitlab-ce

Simple assim :D

Qualquer coisa que você precise alterar relacionado ao gitlab-ce está nesse arquivo:

 sudo vi /etc/gitlab/gitlab.rb
 
Sempre que mexer nesse arquivo execute o comando
 
 sudo gitlab-ctl reconfigure
 
Se algo der errado, ele vai alarmar.

```
![gitlab-ce](http://engenharia.accesstage.com.br/images/gitlab_install.png)

### Nexus

```bash
Estamos utilizando o CentOS 7

wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip
unzip nexus-latest-bundle.zip 
ls
mv nexus-2.14.2-01/ nexus
ls
cd sonatype-work/
chmod -R 775 nexus sonatype-work
sudo adduser nexus
sudo chown -R nexus:nexus /app/nexus /app/sonatype-work/
vi /app/nexus/bin/nexus.rc
ls
cd nexus
ls
cd bin/
ls
sh nexus
sh nexus start
(admin/admin123) - user / pass


```

![nexus](http://engenharia.accesstage.com.br/images/nexus.png)
### Jenkins

```bash
Estou utilizando o CentOS 7

 yum install jenkins
 
 Para alterar a porta
 
  vi /etc/sysconfig/jenkins
  
  JENKINS_PORT="9191"

 
 Fácil né ?


```
![jenkins](http://engenharia.accesstage.com.br/images/jenkins_image.png)

### Apache

```apacheconf

<VirtualHost *:80>
    #DocumentRoot "/www/example1"
    ServerName gitlab.empresa.com.br
    ProxyPass / http://empresa.accesstage.com.br:8282/
    ProxyPassReverse / http://empresa.accesstage.com.br:8282/
</VirtualHost>

<VirtualHost *:80>
    #DocumentRoot "/www/example1"
    ServerName nexus.empresa.com.br
    ProxyPass / http://nexus.empresa.com.br:8081/nexus/
    ProxyPassReverse / http://nexus.empresa.com.br:8081/nexus/

    # Other directives here
</VirtualHost>

<VirtualHost *:80>
    #DocumentRoot "/www/example1"
    ServerName jenkins.empresa.com.br
    ProxyPass / http://jenkins.empresa.com.br:9191/
    ProxyPassReverse / http://jenkins.empresa.com.br:9191/

    # Other directives here
</VirtualHost>


```
![jenkins](http://engenharia.accesstage.com.br/images/apache.png)

Qualquer dúvida deixa ae, que responderemos assim que possível.

Já estamos preparando o post do kubernets e docker >:]
