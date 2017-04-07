---
layout: post
title:  Utilizando Posfix
date:   2017-03-17 11:00:00
author: rodrigomelgar
---
#Configurar Posfix

Recentemente foi necessário configurar o envio de email para o [gitlab-ce](https://gitlab.com/gitlab-org/gitlab-ce) e para o [jira](https://www.atlassian.com/software/jira). Segue um tutorial da utilização de posfix.



```bash
Estamos utilizando o CentOS 7
yum install postfix
vim /etc/postfix/main.cf 
Alterar a propriedade relayhost para o relay da sua empresa
relayhost = nomedorelay.suaempresa.com.br

```

## Também pode ser usado um relay free se a sua empresa não tiver
```bash
relayhost = [smtp.mandrillapp.com]
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_use_tls = yes
#Make sure Postfix listens to localhost only
inet_interfaces = 127.0.0.1
```
***


![postfix](https://www.stewright.me/wp-content/uploads/2012/09/Postfix_logo.png)

See you on the other side.
