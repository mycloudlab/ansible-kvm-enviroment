# Ansible-kvm-environment

Iniciativa para levante de um ambiente mais próximo possível da realidade produtiva, usando kvm. A idéia é usar o ansible para configurar dns, rede, ntp, etc... servindo como base para testes de openshift, kafka etc...

# Utilização

Dentro da pasta ansible está disponível um Makefile que agrega os comandos de execução de playbooks para construção e ajuste do ambiente:


* ```make configure``` - target usado para configurar o projeto **ele deve ser o primeiro comando a ser executado**
* ```make kafka-install``` - target usado para criar uma instalação de kafka
* ```make kafka-uninstall``` - target usado para remover a instalação de kafka

Nota: as máquinas virtuais são criadas utilizando um template que deve ser fornecido na configuração das vms, a imagem pode ser baixada do site da Red Hat https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.8/x86_64/product-software  

# Performance

site: com dicas para testes de performance

https://gist.github.com/ueokande/b96eadd798fff852551b80962862bfb3

```bash
./kafka-topics.sh --create \
--zookeeper 192.168.100.11:2181,192.168.100.12:2181,192.168.100.13:2181 \
--replication-factor 1 \
--partitions 1 \
--topic benchmark-3-0-zstd
```
```bash
./kafka-producer-perf-test.sh --topic benchmark-3-0-zstd \
--num-records 600000 \
--record-size 4096 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=192.168.100.21:9092,192.168.100.22:9092,192.168.100.23:9092,192.168.100.24:9092 \
buffer.memory=67108 \
compression.type=zstd \
batch.size=8196
```