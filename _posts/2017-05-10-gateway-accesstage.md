---
layout: post
title:  como fazer um gateway.
date:   2017-04-05 09:32:00
author: rodrigomelgar
---

### Proposta de criação de gateway - accesstage

Ola,

se voce esta lendo isso, sua empresa vou selecionada para participar da proposta de gateway accesstage. abaixo irei descrever uma serie de pré-requisitos para se trabalhar com agente :)

estamos migrando para uma mundo de micro-serviços e saindo de um mundo middleware proprietario 

voces podem dar uma olhada na arquitetura de referencia que esta sendo produzida nesse link [aqui](http://slides.com/rodrigomelgar/arquitetura-de-referencia#/)


### GIT

Quando falo git, espero que as empresas envolvidas entendam todo o ecossistema do git. e que o codigo esta sempre atulaizado e funcionando (e compilando) no repositorio pois estaremos avaliando isso periodicamente. gitflow deve ser fortemente usado, vamos deixar na master somente release fechado, e master deve ser atulizada somente por pull request que vamos autorizar e avaliar.

###Clean Code e Object Calisthenics
Não faça um codigo só pra voce :( ! a idéia de clean code é bem simples um codigo limpo, identado que qualquer outra pessoa consiga dar manutenção. Já o [Caliisthenics](http://williamdurand.fr/2013/06/03/object-calisthenics/) seria algo como uma boas praticas que tentamos seguir aqui na empresa e gostarismos que nossos parceiros também utilizassem.

###MAVEN
Os projetos devem ser Maven. Os projétos diretamente relacionados/dependentes deverão ser sub-modulos devidamente configurados com um projeto Parent. O projeto Parente deve usar Distribution Management para enviar os releases para o Nexus interno da Accesstage. Além disso, as versões de todas as dependencias dos projétos devem ser gerenciadas pelo Parente através do Dependency Management, e jamais pelos sub-modulos. 
Configurar também o projéto Maven para trabalhar com o Git através de SCM.

###Spring!!!
Como optamos por utilizar o SpringCloud aqui , queremos times com uma ampla experiência em spring - falo serio aqui.

###Docker
A idéia aqui é micro-serviço mesmo , docker's bem enxutos conversando entre si via rest! sem mega container

###YAML OR JSON
Todo container devera ter um yaml (ou json) , pois iremos deployar ele usando dashboard do kubernets

####Kubernets
Iremos utlizar para todo o ambiente da empresa , então se prepare, não quero novatos aqui.

###Prova De Conceito - AKA - POC

para a validação do conceito , o tema é livre , contudo devera conter:

* Spring Netflix Eureka
* Spring Netflix Ribbon
* Sprin Netflix Zuul
* Comunicação rest entre pelomenos dois container
* Erever algo base utilizando PstgreSQL

###Entrega:

* A entrega devera ser feira em algum servidor git gratuituo ou privado da empresa.
* devera conter um readme.md explicando o projeto e as tecnologias envolvidas e como buildar e deployar.
* todo os container's deverão ter yaml ou json , para deployarmos no kubernets
* devera funcionar no kubernets
* devera seguir as premissas acima
* have fun :D
