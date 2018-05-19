#!/usr/bin/env bash

GOVERSION="1.10.2"

echo "Installing golang..."
echo "Downloading binaries..."
wget https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz

echo "Extracting binaries..."
sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz
rm go$GOVERSION.linux-amd64.tar.gz

# .bashrc content
echo >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH="$PATH:$GOROOT/bin"' >> ~/.bashrc
source ~/.bashrc

echo
echo "$(go version) installed successfully."
