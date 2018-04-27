#!/usr/bin/env bash

echo "Installing MongoDB Community Edition..."
echo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt update
sudo apt install -y mongodb-org
echo "Starting MongoDB..."
sudo service mongod start
# Enable service
sudo systemctl enable mongod
echo "Verifying installation, please wait..."
sleep 20
if grep -qF "[initandlisten] waiting for connections on port 27017" /var/log/mongodb/mongod.log;then
  echo
  echo "MongoDB installed successfully."
  echo
  echo "You can start MongoDB shell by \"mongo\" command. To exit type \"exit\" while in MongoBD shell."
else
  echo
  echo "Installation failed!"
fi
