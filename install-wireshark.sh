#!/bin/bash

echo "Installing wireshark packet capture..."
echo
echo "deb http://ppa.launchpad.net/wireshark-dev/stable/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/wireshark.list > /dev/null
echo "deb-src http://ppa.launchpad.net/wireshark-dev/stable/ubuntu $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/wireshark.list > /dev/null
sudo apt update
sudo apt install -y wireshark
echo -e "\033[32m wireshark installed successfully."
tput sgr0
echo
echo "Configuring user group..."
echo
sudo dpkg-reconfigure wireshark-common
sudo gpasswd -a $USER wireshark
echo
echo "You need to logout/login before using wireshark."