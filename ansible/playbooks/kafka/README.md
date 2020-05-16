# kafka playbook

Essa playbook tem por objetivo efetuar a instalação de um ambiente kafka.

# Configuração

O ambiente proposto é instalado via KVM e requer uma subscrição ativa.

O ambiente é definido dentro do diretório vars por meio dos seguintes arquivos:

* dns.yaml - tem por objetivo definir as configurações do servidor de dns que será instalado juntamente com o cluster kafka, e servirá os nomes do cluster, um ponto importante desse arquivo é a configuração do forwarders, atualmente está configurado para usar o dns do google como relay, entretanto dependendo do objetivo pode ser necessário configurar o dns com  o endereço de forwarder da rede local.
* networks.yaml - contém a configuração das bridges que serão criadas para compor a rede de servidores, neste arquivo é também feita a configuração do serviço de dhcp fornecido pelo KVM.
* ntp-client.yaml - configura o ntp dos servidores para ajustar o time.
* vms.yaml - contém a configuração das máquinas virtuais que serão criadas no KVM, as máquinas criadas ainda precisam ser registradas no arquivo inventory da playbook.

# Ambiente

O ambiente proposto nessa playbook é o abaixo:

* 1 - DNS server 
* 3 - zookeeper server
* 4 - kafka servers
* 1 - influxdb server
* 1 - grafana server

## DNS server

O servidor de DNS é feito usando o serviço bind, a configuração do servidor é feita pela estrutura criada no arquivo vars/dns.yaml.

Para essa instalação é feito o registro dos servidores com os seguintes nomes:

* kfk-zoo-01.mycloudlab.com - 192.168.100.11
* kfk-zoo-02.mycloudlab.com - 192.168.100.12
* kfk-zoo-03.mycloudlab.com - 192.168.100.13
* kfk-kafka-01.mycloudlab.com - 192.168.100.21
* kfk-kafka-02.mycloudlab.com - 192.168.100.22
* kfk-kafka-03.mycloudlab.com - 192.168.100.23
* kfk-kafka-04.mycloudlab.com - 192.168.100.24
* kfk-influxdb.mycloudlab.com - 192.168.100.31
* kfk-grafana.mycloudlab.com - 192.168.100.32

O registro PTR reverso também foi configurado.

# zookeeper server

O servidor zookepper é .....

TODO.

# kafka server

o servidor kafka é .....

TODO

# influxdb server

O servidor influxdb é o banco de dados de métricas de monitoramento do cluster.

TODO informar a senha configurada.



# grafana server

O servidor grafana é o responsável por armazenamento das dashboards de monitoria do cluster kafka. 




https://access.redhat.com/documentation/en-us/red_hat_amq/7.6/html-single/using_amq_streams_on_rhel/index