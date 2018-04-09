#!/bin/bash

echo "Installing Ansible on control machine..."
echo
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
echo
echo -e "\033[32m Ansible installed successfully."
tput sgr0
echo
echo "Edit \"/etc/ansible/hosts\" for setting your host machines."
echo "More info at: http://docs.ansible.com"
