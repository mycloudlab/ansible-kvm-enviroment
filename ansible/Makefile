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
	@printf "$(YELLOW)Ansible Playbook - kafka $(NC)\n\n"
	@printf "opções:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(NC) %s$(NC)\n", $$1, $$2}'
	@printf "\n"

.PHONY:

vms-install: ## instala as vms e rede 
	@unbuffer ansible-playbook playbooks/run-vms-install.yaml | sed -E 's/\\n/\n/g'

vms-start: ## inicia as vms
	@unbuffer ansible-playbook playbooks/run-vms-start.yaml | sed -E 's/\\n/\n/g'

vms-ssh-keys: ## configura ssh
	@unbuffer ansible-playbook -i inventory/hosts_config-ssh.sh playbooks/run-vm-ssh-keys.yaml  | sed -E 's/\\n/\n/g'

vms-common-config: ## faz a configuração comum do servidor
	@unbuffer ansible-playbook playbooks/run-vm-common-config.yaml | sed -E 's/\\n/\n/g'

vms-subscribe: ## subscreve as maquinas
	@unbuffer ansible-playbook playbooks/run-vms-subscribe.yaml | sed -E 's/\\n/\n/g'

test: 
	@unbuffer ansible-playbook  playbooks/run-test.yaml | sed -E 's/\\n/\n/g'


cleanup: ## limpa instalação removendo máquinas e rede
	@unbuffer ansible-playbook playbooks/run-cleanup.yaml | sed -E 's/\\n/\n/g'
