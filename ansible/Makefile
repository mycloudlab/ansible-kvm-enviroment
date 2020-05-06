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
	@unbuffer ansible-playbook -i inventory/hosts.yaml playbooks/run-vm-install.yaml | sed -E 's/\\n/\n/g'

vms-start: ## inicia as vms
	@unbuffer ansible-playbook -i inventory/hosts.yaml playbooks/run-vm-start.yaml | sed -E 's/\\n/\n/g'

vms-ssh-keys: ## configura ssh
	@unbuffer ansible-playbook -i inventory/hosts.yaml playbooks/run-vm-ssh-keys.yaml --extra-vars "ansible_user=root ansible_password=kafka" | sed -E 's/\\n/\n/g'
	# todo desabilitar usuario root com acesso ao ssh

vms-common-config: ## faz a configuração comum do servidor
	@unbuffer ansible-playbook -i inventory/hosts.yaml playbooks/run-vm-common-config.yaml | sed -E 's/\\n/\n/g'

vms-subscribe: ## subscreve as maquinas
	@unbuffer ansible-playbook -i inventory/hosts.yaml playbooks/run-vm-subscribe.yaml | sed -E 's/\\n/\n/g'



cleanup: ## limpa instalação removendo máquinas e rede
	@unbuffer ansible-playbook -i inventory/hosts.yaml playbooks/run-cleanup.yaml | sed -E 's/\\n/\n/g'
