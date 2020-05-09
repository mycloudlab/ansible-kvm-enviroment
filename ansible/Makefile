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
	@printf "$(YELLOW)Ansible Playbook - kvm environment lab$(NC)\n\n"
	@printf "opções:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN)%-20s$(NC) %s$(NC)\n", $$1, $$2}'
	@printf "\n"

.PHONY:

configure: ## target que deve ser executado ao fazer o clone do projeto, ela configura a workspace do usuário 
	@git update-index --assume-unchanged vars/hrel_subscription.yaml 
	@printf "\nWorkspace configurada com sucesso. \n\n"
	
kafka-install: ## instala kafka
	@unbuffer ansible-playbook -i playbooks/kafka/inventory playbooks/kafka/kafka-install.yaml | sed -E 's/\\n/\n/g'

kafka-uninstall: ## desinstala o kafka
	@unbuffer ansible-playbook -i playbooks/kafka/inventory playbooks/kafka/kafka-uninstall.yaml | sed -E 's/\\n/\n/g'
