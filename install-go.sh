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
echo 'export GOPATH="$HOME/golib"' >> ~/.bashrc
echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
echo 'export GOPATH="$GOPATH:$HOME/Code/go"' >> ~/.bashrc
# source ~/.bashrc

export GOROOT=/usr/local/go
export PATH="$PATH:$GOROOT/bin"
export GOPATH="$HOME/golib"
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$GOPATH:$HOME/Code/go"

mkdir ~/Code/go/src/github.com/xaqron -p
mkdir ~/Code/go/bin
mkdir ~/Code/go/pkg
mkdir ~/golib

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
