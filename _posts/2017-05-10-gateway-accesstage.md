---
layout: post
title:  como fazer um gateway.
date:   2017-04-04 20:07:00
author: rodrigomelgar
---

### Proposta de criação de gateway - accesstage

Olá,

Se você est lendo isso, sua empresa foi selecionada para participar da proposta de gateway accesstage. A seguir, descrevo uma série de pré-requisitos para trabalhar conosco :)

Estamos saindo de um mundo middleware proprietário e em migração para um mundo de micro-serviços.

Nesse link [aqui], é possível conferir a arquitetura de referência que está sendo produzida nesse link (http://slides.com/rodrigomelgar/arquitetura-de-referencia#/)


### GIT

Quando falo git, espero que as empresas envolvidas entendam todo o ecossistema do git. E que o código está sempre atualizado e em funcionamento, compilado no repositório, pois avaliaremos isso periodicamente. Gitflow deve ser fortemente usado, deixaremos na master somente release fechado, e a master deve ser atualizada somente por pull request que vamos autorizar e avaliar.

### Clean Code e Object Calisthenics
Não faça um código só pra voce :( ! a ideia de clean code é bem simples um código limpo, identado que qualquer outra pessoa consiga dar manutenção. Já o [Caliisthenics](http://williamdurand.fr/2013/06/03/object-calisthenics/) seria algo como boas práticas que tentamos seguir aqui na empresa e gostaríamos que nossos parceiros também utilizassem.

### MAVEN
Os projetos devem ser Maven. Os projetos diretamente relacionados/dependentes deverão ser sub-módulos devidamente configurados com um projeto Parent. O projeto Parente deve usar Distribution Management para enviar os releases para o Nexus interno da Accesstage. Além disso, as versões de todas as dependências dos projetos devem ser gerenciadas pelo Parente através do Dependency Management, e jamais pelos sub-módulos. 
Configurar também o projéto Maven para trabalhar com o Git através de SCM.

### Spring!!!
Como optamos por utilizar o SpringCloud aqui, queremos times com uma ampla experiência em spring - falo sério aqui.

### Docker
A ideia aqui é micro-serviço mesmo, docker's bem enxutos conversando entre si via rest! sem mega container

### YAML OR JSON
Todo container deverá ter um yaml (ou json), pois iremos deployar ele usando dashboard do kubernets

### Kubernets
Utilizaremos para todo o ambiente da empresa, então se prepare, não quero novatos aqui.

### Prova De Conceito - AKA - POC

Para a validação do conceito, o tema é livre contudo deverá conter:

* Spring Netflix Eureka
* Spring Netflix Ribbon
* Spring Netflix Zuul
* Comunicação rest entre pelo menos dois container's
* Escrever algo base utilizando PstgreeSQL

### Entrega:

* A entrega deverá ser feita em algum servidor git gratuituo ou privado da empresa.
* Deverá conter um readme.md explicando o projeto e as tecnologias envolvidas e como buildar e deployar.
* Todos os container's deverão ter yaml ou json, para deployarmos no kubernets
* Deverá funcionar no kubernets
* Deverá seguir as premissas acima
* Have fun :D
