# Ansible-kvm-environment

Iniciativa para levante de um ambiente mais próximo possível da realidade produtiva, usando kvm. A idéia é usar o ansible para configurar dns, rede, ntp, etc... servindo como base para testes de openshift, kafka etc...

# Utilização

Dentro da pasta ansible está disponível um Makefile que agrega os comandos de execução de playbooks para construção e ajuste do ambiente:


* ```make configure``` - target usado para configurar o projeto **ele deve ser o primeiro comando a ser executado**
* ```make kafka-install``` - target usado para criar uma instalação de kafka
* ```make kafka-uninstall``` - target usado para remover a instalação de kafka

Nota: as máquinas virtuais são criadas utilizando um template que deve ser fornecido na configuração das vms, a imagem pode ser baixada do site da Red Hat https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.8/x86_64/product-software  