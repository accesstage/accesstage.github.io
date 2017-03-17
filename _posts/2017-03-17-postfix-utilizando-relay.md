---
layout: post
title:  Utilizando Posfix
date:   2017-03-17 11:00:00
author: rodrigomelgar
---
#Configurar Posfix

Recentimente precisei configurar o envio de email para o [gitlab-ce](https://gitlab.com/gitlab-org/gitlab-ce) e para o [jira](https://www.atlassian.com/software/jira)  segue um tutorial da utulização de posfix.



```bash
Estou utilizando o CentOS 7
yum install postfix
vim /etc/postfix/main.cf 
altera a propriedade relayhost para o relay da sua empresa
relayhost = nomedorelay.suaempresa.com.br

```

## tambem pode usar um relay free se a sua empresa não tiver
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

see you on the other side
<div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://engenharia-accesstage-com-br.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>