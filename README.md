# Kafka

Esse documento apresenta uma demo do kafka com as seguintes features habilitadas.


* criação de maquina virtual do zero usando kvm
* Tunning do SO:
  * jumbo frames
  * ring buffer
  * limites do SO
  * monitoria
* monitoria com prometheus, alertmanager e grafana




<network>
  <name>privatenet</name>
  <uuid>23dcbd77-b150-43a1-be0f-d72589004156</uuid>
  <bridge name='privatebr0' stp='on' delay='0'/>
  <mac address='52:54:00:38:57:17'/>
</network>

<network>
  <name>default</name>
  <uuid>586ed6f9-9492-4c40-8017-3bd53b5f71c8</uuid>
  <forward mode='nat'>
    <nat>
      <port start='1024' end='65535'/>
    </nat>
  </forward>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:cd:5b:e8'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>


#CRIAÇÃO DA REDE DE VMS
https://github.com/jfenal/ansible-role-virt-net

#CRIAÇÃO DE VMS
https://www.richardwalker.dev/guides/ansible_libvirtlabs/
https://adam.younglogic.com/2019/01/remotely-provisioning-a-virtual-machine-using-ansible-and-libvirt/



yum install iperf3 -y
iperf3 -s
iperf3 -c 192.168.127.10
ip link set dev eth0 mtu 9000
 