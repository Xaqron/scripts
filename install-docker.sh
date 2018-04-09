#!/bin/bash

echo "Installing docker..."
echo

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

echo
echo -e "\033[32m Docker installed successfully."
tput sgr0

# if [ $1 = "-t" ]; then
  echo
  echo "Testing installation..."
  sudo docker run hello-world
# fi

### OR use script ###
# curl -fsSL get.docker.com -o docker-installer.sh
# sudo bash docker-installer.sh
