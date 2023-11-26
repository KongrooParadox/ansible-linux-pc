init:
	sudo apt update
	sudo apt full-upgrade -y
	sudo apt autoremove --purge -y
	sudo apt install -y python3 python3-dev python3-venv python3-pip python3-psutil
	cd ~ && cd -
	pip3 install -r requirements.txt
	ansible-galaxy install -r requirements.yml

system:
	@$(call lint_exec,"system")

packages:
	@$(call lint_exec,"packages")

config:
	@$(call lint_exec,"config")

all:
	@$(call lint_exec,"all")

debug:
	@$(call lint_exec,"all","-v")

verbose:
	@$(call lint_exec,"all","-vvv")

define lint_exec
	$(eval $@_TAG = $(1))
	$(eval $@_FLAGS = $(2))
	ansible-lint; test $$? -eq 0 && ansible-playbook ${$@_FLAGS} workstation.yml --tags ${$@_TAG} || echo "Fix ansible-lint before running playbook !"
endef
