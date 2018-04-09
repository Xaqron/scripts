#!/bin/bash

# *** NOT TESTED ***
# TODO: TEST & DEBUG

sudo apt install -y build-essential
echo "Checking compiler..."
if [ -z $(command -v g++) ]; then
   # install gcc
   curl -o- https://raw.githubusercontent.com/Xaqron/scripts/master/install-gcc.sh | bash
fi
echo
echo "Installing GUI requirements..."
sudo apt install -y libwxgtk3.0-dev
echo "Installing gambit v15.1.1 (latest stable)..."
echo "Downloading source code..."
wget https://github.com/gambitproject/gambit/archive/v15.1.1.tar.gz
tar -xzvf v15.1.1.tar.gz
cd v15.1.1
echo "Building software (this may take a while, be patient)..."
./configure --disable-enumpoly
make
sudo make install
echo -n "Run gambit (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
   gambit
fi