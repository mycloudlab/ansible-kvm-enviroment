# Ansible-kvm-environment

Iniciativa para levante de um ambiente mais próximo possível da realidade produtiva, usando kvm. A idéia é usar o ansible para configurar dns, rede, ntp, etc... servindo como base para testes de openshift, kafka etc...

# Utilização

Dentro da pasta ansible está disponível um Makefile que agrega os comandos de execução de playbooks para construção e ajuste do ambiente:


* ```make configure``` - target usado para configurar o projeto **ele deve ser o primeiro comando a ser executado**
* ```make vms-install``` - instala as vms e a rede
* ```make vms-start``` - inicia as vms
* ```make vms-ssh-keys``` - configura as vms para acesso pelo ansible, fazendo a cópia de chaves ssh
* ```make vms-subscribe``` - subscreve as máquinas criadas
* ```make vms-common-config``` - efetua a configuração comum de servidores como tunning de rede, configuração de ntp, etc...
* ```make help``` - Exibe uma ajuda com os comandos disponíveis

as configurações das vms são feitas via variável que encontra-se na pasta ansible/vars:

* ```networks.yaml``` - contém a configuração de rede para os servidores
* ```vms.yaml``` - contém a configuração das vms que devem existir, bem como a rede da qual fazem parte e as configurações da vm
* ```hrel_subscription.yaml``` - contém as configurações para subscrição das máquinas virtuais

Nota: as máquinas virtuais são criadas utilizando um template que deve ser fornecido na configuração das vms, a imagem pode ser baixada do site da Red Hat https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.8/x86_64/product-software  