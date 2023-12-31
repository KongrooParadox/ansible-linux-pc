#!/bin/bash

sudo apt install -y libssl-dev \
unzip linux-headers-$(uname -r) \
dkms lsb-release linux-source x11-xserver-utils \
wget libdrm-dev libelf-dev git pciutils

cd /usr/src/linux-headers-$(uname -r)
sudo tar -xaf /usr/src/linux-source-$(uname -r | egrep -o '^[0-9]+\.[0-9]+').tar.xz --strip-components=1
sudo make oldconfig
sudo make prepare

svn export https://github.com/AdnanHodzic/displaylink-debian/trunk /tmp/dislaylink
cd /tmp/dislaylink
sudo ./displaylink-debian.sh --install
cd ~

sudo rm /etc/X11/xorg.conf.d/20-displaylink.conf
read -p "Reboot now ? Y/n (defaults to Yes)" reboot_choice
case $reboot_choice in
    [Yy]* ) sudo reboot now;;
    [Nn]* ) exit;;
    * ) sudo reboot now;;
esac
