#!/bin/sh
echo "Installing NVM + Node.js + NPM + PM2 + Requirements..."
echo "Installing Requirements..."
sudo apt install -y build-essential libssl-dev python-software-properties
echo
echo "Installing NVM (Node Version Manager)..."
VER=$(curl --silent "https://api.github.com/repos/creationix/nvm/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
echo "Installing NVM version $VER..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/$VER/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts
echo
echo "Node.js version $(node -v) installed successfully."
echo
echo "Installing latest NPM..."
npm install -g npm
echo
echo "NPM version $(npm -v) installed successfully."
echo
echo "Installing PM2..."
npm install -g pm2
TMPCMD=$(pm2 startup)
CMD=${TMPCMD//$PATH/'$PATH'}
echo $CMD | grep -o 'sudo.*'
echo
echo "PM2 version $(pm2 -v) installed successfully."
echo
echo "*** Node.js + NPM + PM2 installed successfully! ***"
echo
