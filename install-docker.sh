#!/usr/bin/env bash

echo "Installing docker Community Edition..."
echo

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo rm -f /etc/apt/sources.list.d/docker-ce.list 2> /dev/null
sudo rm -f /etc/apt/sources.list.d/docker-ce.list.save 2> /dev/null
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list > /dev/null
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

echo "Installing docker compose..."
echo
VER=$(curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -L https://github.com/docker/compose/releases/download/$VER/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo
echo -e "\033[32m Docker Community Edition installed successfully."
tput sgr0

echo
echo -n "A Rboot is needed for docker CE to work. Reboot now (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
   sudo reboot
fi

# if [ $1 = "-t" ]; then
  # echo
  # echo "Testing installation..."
  # sudo docker run hello-world
# fi

### OR use script ###
# curl -fsSL get.docker.com -o docker-installer.sh
# sudo bash docker-installer.sh
