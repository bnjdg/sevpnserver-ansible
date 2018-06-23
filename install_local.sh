#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install sudo

#ensure running as root
if [ "$(id -u)" != "0" ]; then
 exec sudo "$0" "$@"
fi

DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install ansible python-minimal git

git clone https://github.com/bjdag1234/sevpnserver-ansible /root/sevpn-setup
cd /root/sevpn-setup
ansible-playbook /root/sevpn-setup/localhost.yml -u root
