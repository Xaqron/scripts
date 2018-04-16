#!/bin/bash

echo "Installing requirements..."
sudo apt install -y pwgen
sudo apt install -y python3-pip
echo "Installing shadowsocks..."
sudo pip3 install shadowsocks
echo "Writing config file..."
IP=$(curl ipinfo.io/ip)
PORT=$((5000 + RANDOM % 4000))
PASSWORD=$(pwgen -1aB 16 1)
echo '{' | sudo tee /etc/shadowsocks.json > /dev/null
echo "\"server\":\"$IP\"," | sudo tee -a /etc/shadowsocks.json > /dev/null
echo "\"server_port\":$PORT," | sudo tee -a /etc/shadowsocks.json > /dev/null
echo "\"local_port\":0," | sudo tee -a /etc/shadowsocks.json > /dev/null
echo "\"password\":\"$PASSWORD\"," | sudo tee -a /etc/shadowsocks.json > /dev/null
echo "\"timeout\":600," | sudo tee -a /etc/shadowsocks.json > /dev/null
echo "\"method\":\"aes-256-cfb\"" | sudo tee -a /etc/shadowsocks.json > /dev/null
echo '}' | sudo tee -a /etc/shadowsocks.json > /dev/null
echo
echo "Enabling autostart..."
COMMAND='/usr/bin/python3 /usr/local/bin/ssserver -c /etc/shadowsocks.json -d start'
sudo sed -i "s@^exit[[:space:]]0@$COMMAND\n&@" /etc/rc.local
echo "Adding firewall rule..."
sudo ufw allow $PORT
echo
echo "Starting shadowsocks..."
sudo ssserver -c /etc/shadowsocks.json -d start
echo
echo "You can also edit \"/etc/shadowsocks.json\" file manually."
echo
echo "*******************"
echo "IP: $IP"
echo "Port: $PORT"
echo "Password: $PASSWORD"
echo "Encryption Method: AES-256-CFB"
echo "*******************"
echo
# Writing client config file
echo '{' > ~/shadowsocks.json
echo "\"server\":\"$IP\"," >> ~/shadowsocks.json
echo "\"server_port\":$PORT," >> ~/shadowsocks.json
echo "\"local_address\": \"127.0.0.1\"," >> ~/shadowsocks.json
echo "\"local_port\":1080," >> ~/shadowsocks.json
echo "\"password\":\"$PASSWORD\"," >> ~/shadowsocks.json
echo "\"timeout\":1200," >> ~/shadowsocks.json
echo "\"method\":\"aes-256-cfb\"" >> ~/shadowsocks.json
echo '}' >> ~/shadowsocks.json

echo "You can find cilent configuration file at: \"~/shadowsocks.json\""
