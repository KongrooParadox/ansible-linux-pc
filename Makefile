init :
    apt update
    apt upgrade -y
    apt install -y python3-pip
    pip3 install -r requirements.txt
    ansible-galaxy install -r requirements.yml

