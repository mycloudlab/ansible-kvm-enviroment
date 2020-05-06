#!/bin/bash

# função para converter yaml para json
function yaml2json()
{
    ruby -ryaml -rjson -e \
         'puts JSON.pretty_generate(YAML.load(ARGF))' $*
}


# monta saida conforme esperado pelo ansible
saida=""
saida+="{\"_meta\":{\"hostvars\": {"
for k in $(cat vars/vms.yaml | yaml2json | jq -c '.vms[] | { password: .root_password,ip: .networks[0].ip }'); do
    saida+=$(echo $k | jq '.ip')
    saida+=": {\"ansible_user\":\"root\", \"ansible_password\":"
    saida+=$(echo $k | jq '.password')
    saida+="},"
done

saida=${saida::-1}

saida+="}},\"all\": {\"children\": [\"ungrouped\"]},\"ungrouped\": {\"hosts\": ["
for k in $(cat vars/vms.yaml | yaml2json | jq -c '.vms[] | { password: .root_password,ip: .networks[0].ip }'); do
  saida+=$(echo $k |jq '.ip')
  saida+=","
done

saida=${saida::-1}

saida+="]}}"
echo $saida