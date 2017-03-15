---
layout: post
title:  Do SVN ao Git!
date:   2017-03-15 11:00:00
---

### Por que?
O Git já não é mais uma grande novidade. Está amplamente difundido no mercado e suas vantages (como feature branching, local repository, staging area ...) são discutidas e comparadas suficientemente na internet.

Por outro lado é interessante analisar os motivos que nos levaram a escolher a migração do SNV para o Git.
Nosso cenário é composto por uma quantidade grande de projetos hora feitos internamente, hora desenvolvidos com parceiros. De modo que após muitos anos e muitos usuários no SVN, encontramos projetos com diversas estruturas de branches falhas, organizações variádas de diretórios além de projetos poluidos (com PDFs e imagens de definições do projeto).

Sentimos a necessidade de parar e organizar a casa. 

### Benefícios

Nesse sentido buscamos como solução o [GitLab](https://about.gitlab.com/). Nele as seguintes soluções nos atendem bem:

* A estrutura de branches é mais dificíl de burlar.
No nosso SVN, é comum encontrarmos falsas branches. Ou seja, em alguns projetos, existem simples diretórios que fazem as vezes de branches mas que não foram criadas através do SVN e sim por usuários desavisados. O que resulta em dificuldades na hora de gerenciar as supostas branches.
No mundo do git, os comandos bem definidos para a criação e manutenção de branches bem como a interface gráfica do GitLab ajudam a previnir esse erro e evidênciam caso ocorram.

* É possível trabalhar com pull request.
Podemos configurar o GitLab para previnir commits diretamente na master. Obrigando os desenvolvedores internos e parceiros a trabalharem em suas próprias branches, e ao final do ciclo de desonvolvimento abrirem pull requests para a branche princípal.
É interessante ainda a possíbilidade de configurar um sistema de aprovação dessas requisições onde um número pré-determinado de membros da equipe precisaria aprovarar o merge.
Desse modo é possível controlar o que é commitado na master e previnir que códigos de baixa qualidade bem como arquivos poluentes sejam reintegrados no repositório.

* A possibiliade de usarmos os README.md 
Em cada projeto podemos detalhar para novos coloboradores o que acharmos importante sobre o projeto. Podemos explicar como criar o ambiente de desonvolvimento, o objetivo do projeto, o básico da arquitetura, bancos de dados usados, usuários de teste e muito mais. Eliminando a princípio a necessidade de outras ferramentas como Wikis ou [Confluence](https://www.atlassian.com/software/confluence).

Existem muitas outras funcionalidades e plugins do GitLab que nos atraem a realizar a migração. Essas vantagens apresentadas são algumas mais voltadas ao nosso dia a dia de desenvolvimento do que a técnologia da ferramenta em si. É bem possível realizar essas alterações em outros controladores de versão (com mais, ou menos dificuldades). 

O fato é que o git parece proporcionar tudo isso de forma rápida e natural. Nos permitindo ainda a implementação de padrões de uso da ferramenta, como o git-flow por exemplo.

### Dificuldades

Vale ainda ressaltar que nem tudo são flores no processo de migração.

Nossa primeira idéia foi usar alguma ferramenta ou método de migração automátizado. Nesse intuito tentamos usar o tutorial da própria Atlassian (https://www.atlassian.com/). O qual eu recomendo a todos pela simplicidade e detalhamento dos passos:

https://www.atlassian.com/git/tutorials/migrating-overview

Contudo no nosso caso, onde os repositórios SVN eram muito grandes e bastante despadronizados o método não se encaixou.

Ficou claro para a equipe que a migração deveria ser feita de modo manual e gradual. Onde para cada projéto que fossemos dar manutenção, precisariamos reorganiza-los e subir no git individualmente como um novo projéto.

Acredito que nenhum método automático garante mais qualidade do que esse no que tange a estrutura do repositório. Mas é preciso tomar alguns cuidados a seguir por esse caminho:

* Adicionar tempo de migração às nossas estimativas de tarefas
* É preciso manter os projétos no SVN para consultarmos o histórico de alterações por pelo menos um ano. Bloquando as permissões de escrita aos projetos no SVN.

Até o momento desse post eu conto 14 projetos já migrados desde que começamos esse empreendimento a cerca de um mês. O resultado observado neles é bem satisfatório.

Um outro aspecto notável em uma mudança como essas é a capacitação do time. Nem todos tem uma boa experiência com a ferramenta. Prentendemos organizar um treinamento interno e acreditamos que com o tempo e melhor conhecimento da ferramenta por parte de todos, o número de projétos migrados por mês cresca. 

O passo a seguir é tentar tirar proveito da integração do Git com o [Maven-SCM](https://maven.apache.org/scm/). As dificuldades e benefícios nessa missão vocês conferem em um próximo post.