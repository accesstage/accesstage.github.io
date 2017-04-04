---
layout: post
title:  Ferramentas de Apoio!
date:   2017-04-04 20:07:00
author: rodrigomelgar
---

### Git - Nexus - Jenkins
Após o incio a estratégia da empresa de migrar do svn para o git  leia mais aqui no post do  [@leo](http://engenharia.accesstage.com.br/2017/03/15/do-svn-ao-git.html) conseguimos um servidor novinho em folha , com 4gb de ram e 2 vcpu e instalamos o centOS nele.


### Intalações


* GitLab Ce

* Jenkins

* Nexus

Mostrarei um how-to-do para qualquer um fazer, acho legal escrever essa material pois existe pouca coisa em portugues, e acredito que esse blog ira alcancar um publico maior deixando os posts em portugues.

### GitLab-CE

```bash
Estou utilizando o CentOS 7

yum install gitlab-ce

simple assim :D

qualquer coisa que voce precisa alterar relacionado ao gitlab-ce esta nesse arquivo:

 sudo vi /etc/gitlab/gitlab.rb
 
 sempre que mexer nesse arquivo execute o comando
 
 sudo gitlab-ctl reconfigure
 
se algo der errado, ele vai alarmar.

```
![gitlab-ce](http://engenharia.accesstage.com.br/images/gitlab_install.png)

### Nexus

```bash
Estou utilizando o CentOS 7

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

![nexus](http://engenharia.accesstage.com.br/images/nexus.png)

```
### Jenkins

```bash
Estou utilizando o CentOS 7

 yum install jenkins
 
 para alterar a porta
 
  vi /etc/sysconfig/jenkins
  
  JENKINS_PORT="9191"

 
 facil né ?


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
![jenkins](http://engenharia.accesstage.com.br/images/jenkins_image.png)

qualquer duvida deixa ae , que respondo assim que possivel.

Ja estou preparando o post do kubernets e docker >:]