init:
	sudo apt update
	sudo apt full-upgrade -y
	sudo apt autoremove --purge -y
	sudo apt install -y python3 python3-dev python3-venv python3-pip python3-psutil
	cd ~ && cd -
	pip3 install -r requirements.txt
	ansible-galaxy install -r requirements.yml

system:
	ansible-playbook workstation.yml --tags system

packages:
	ansible-playbook workstation.yml --tags packages

config:
	ansible-playbook workstation.yml --tags config

all:
	ansible-playbook workstation.yml --tags all

debug:
	ansible-playbook -v workstation.yml --tags all

verbose:
	ansible-playbook -vvv workstation.yml --tags all

