.DEFAULT_GOAL := help
SHELL         := /bin/bash
RED           := \033[0;31m
GREEN         := \033[0;32m
YELLOW        := \033[1;33m
CYAN          := \033[0;36m
NC            := \033[0m # No Color
WHOAMI        :=`whoami`

help:
	@printf "Uso: make [opções]\n\n"
	@printf "$(YELLOW)Ansible Playbook - kvm environment lab $(NC)\n\n"
	@printf "opções:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(NC) %s$(NC)\n", $$1, $$2}'
	@printf "\n"

.PHONY:

configure: ## target que deve ser executado ao fazer o clone do projeto, ela configura a workspace do usuário 
	@git update-index --assume-unchanged vars/hrel_subscription.yaml 
	@printf "\nWorkspace configurada com sucesso. \n\n"
	
vms-install: ## instala as vms e rede 
	@unbuffer ansible-playbook playbooks/run-vms-install.yaml | sed -E 's/\\n/\n/g'

vms-start: ## inicia as vms
	@unbuffer ansible-playbook playbooks/run-vms-start.yaml | sed -E 's/\\n/\n/g'

vms-ssh-keys: ## configura ssh
	@unbuffer ansible-playbook -i inventory/hosts_config-ssh.sh playbooks/run-vm-ssh-keys.yaml  | sed -E 's/\\n/\n/g'

vms-subscribe: ## subscreve as maquinas
	@unbuffer ansible-playbook playbooks/run-vms-subscribe.yaml | sed -E 's/\\n/\n/g'

vms-common-config: ## faz a configuração comum do servidor
	@unbuffer ansible-playbook playbooks/run-vm-common-config.yaml | sed -E 's/\\n/\n/g'

vms-configure-ntp-client: ## faz a configuração comum do servidor
	@unbuffer ansible-playbook playbooks/run-vms-configure-ntp-client.yaml | sed -E 's/\\n/\n/g'

vms-configure-high-performance: ## faz a configuração comum do servidor
	@unbuffer ansible-playbook playbooks/run-vms-configure-high-performance.yaml | sed -E 's/\\n/\n/g'

dns-install: ## instala o serviço de dns
	@unbuffer ansible-playbook playbooks/run-dns-install.yaml | sed -E 's/\\n/\n/g'

vms-configure-dns: ## faz a configuração dns nas vms
	@unbuffer ansible-playbook playbooks/run-vms-configure-dns.yaml -vvv | sed -E 's/\\n/\n/g'

test: 
	@unbuffer ansible-playbook  playbooks/run-test.yaml | sed -E 's/\\n/\n/g'


cleanup: ## limpa instalação removendo máquinas e rede
	@unbuffer ansible-playbook playbooks/run-cleanup.yaml | sed -E 's/\\n/\n/g'
