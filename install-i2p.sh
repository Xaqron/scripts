#!/bin/bash

echo "Installing I2P..."
echo
sudo apt-add-repository -y ppa:i2p-maintainers/i2p
sudo apt update
sudo apt install -y i2p

echo -n "Start i2p service (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
   i2prouter start
   echo
   echo "i2p service started..."
fi
echo
echo "to start i2p service use this command: \"i2prouter start\""