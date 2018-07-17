#!/usr/bin/env bash

echo "Installing golang..."
echo
sudo rm -rf /usr/local/go 2> /dev/null
GOVERSION=$(curl -fsSL --silent "https://golang.org/dl" | grep -E -o 'dl.google.com/go/go.+windows' | head -1 | grep -E -o '[0-9]+\.[0-9]+.[^.windows]')

echo "Downloading binaries..."
wget https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz

echo "Extracting binaries..."
sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz
rm go$GOVERSION.linux-amd64.tar.gz

mkdir ~/Code/go/src/github.com/xaqron -p
mkdir ~/Code/go/bin
mkdir ~/Code/go/pkg
mkdir ~/golib

# .bashrc content
echo >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH="$PATH:$GOROOT/bin"' >> ~/.bashrc
echo 'export GOPATH="$HOME/golib"' >> ~/.bashrc
echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
echo 'export GOPATH="$GOPATH:$HOME/Code/go"' >> ~/.bashrc

source ~/.bashrc

echo "Downloading packages..."

go get -u github.com/nsf/gocode
go get -u github.com/derekparker/delve/cmd/dlv
go get -u github.com/uudashr/gopkgs
go get -u github.com/sqs/goreturns
go get -u golang.org/x/tools

if [ ! -z $(command -v code) ]; then
   code --install-extension ms-vscode.go
fi

echo
echo "$(go version) installed successfully."
