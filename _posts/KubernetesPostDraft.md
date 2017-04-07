## Primeiramente

 É preciso entender um dos princípais pontos diferencias do Kubernetes que é o modo como ele realiza o processo de deploy.
 Ele permite realizar o deploy de aplicações sem especificar uma máquina alvo em particular. Para isso a aplicação deve ser encapsulada em um *container*. Aqui esbarramos no primeiro conceito o qual explicaremos em detalhes mais tarde "O que é um *container* no mundo Kubernetes?".
 No momento vamos focar em entender porque o deploy nesse modelo é vantajoso:

 1. É um modelo mais flexivel. Onde a aplicação não precisa mais conhecer e se integrar de modo profundo com o servidor.
 2. O Kubernetes gerencia e escala automáticamente os *containers* (aplicações encapsuladas) através dos seus *clusters* de modo otimizado.  

 Encontramos então um segundo ponto a ser compreendido: 

## Cluseter Kubernetes

 Existem dois tipos princípais de *clusters*, _Master_ e _Nodes_.
 O _Master_ se encarrega de gerenciar todos os outros cluster. Sendo responsável por scalar, agendar e atualizar as aplicações.

 Um _node_ é uma máquina (virtual ou fisica) que o Kubernetes usa como *cluster*.
 O que faz uma máquina ser um *cluster* é o fato de ela ter um *Kubelet*, que é justamente quem gerencia o node e se comunica com a master. Usualmente é preciso ter ao menos três _nodes_ e uma _master_.

 A comunicação entre os _nodes_ e a _master_ ocorre através da de uma API do próprio Kubernetes de forma automática. Essa API pode ser usada também de fora, para gerenciamento direto dos _clusters_.
 O deploy ocorre na *master*, que então aloca os *containers* das aplicações nos _nodes_.