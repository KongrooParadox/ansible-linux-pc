init:
	apt update
	apt full-upgrade -y
	apt autoremove --purge -y
	apt install -y python3-pip
	ansible-galaxy install -r requirements.yml

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

