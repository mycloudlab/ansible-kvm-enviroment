# Ansible-kvm-environment

Iniciativa para levante de um ambiente mais próximo possível da realidade produtiva, usando kvm. A idéia é usar o ansible para configurar dns, rede, ntp, etc... servindo como base para testes de openshift, kafka etc...

# Utilização

Dentro da pasta ansible está disponível um Makefile que agrega os comandos de execução de playbooks para construção e ajuste do ambiente:

* ```make help``` - Exibe uma ajuda com os comandos disponíveis

