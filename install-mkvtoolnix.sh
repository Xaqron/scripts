#!/bin/bash

echo "Installing mkvtoolnix..."
curl -fsSL https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add -
sudo rm -f /etc/apt/sources.list.d/mkvtoolnix.list 2> /dev/null
sudo rm -f /etc/apt/sources.list.d/mkvtoolnix.list.save 2> /dev/null
echo "deb https://mkvtoolnix.download/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mkvtoolnix.list > /dev/null
echo "# deb-src https://mkvtoolnix.download/ubuntu $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/mkvtoolnix.list > /dev/null
sudo apt update
sudo apt install -y mkvtoolnix mkvtoolnix-gui
echo "Done!"
