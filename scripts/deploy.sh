#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y software-properties-common
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y lib32gcc-s1 steamcmd apache2 zip

echo "Linking steamcmd executable..."
ln -s /usr/games/steamcmd /home/steam/valheim-server/scripts/steamcmd
echo "Creating worlds folder..."
mkdir -p /home/steam/.config/unity3d/IronGate/Valheim/worlds_local

echo "Installing Valheim..."
./InstallUpdate.sh

echo "Firewall settings..."
sudo ufw allow 2346
sudo ufw allow 2347
sudo ufw allow 'Apache Full'


echo "Configuring web server..."
sudo cp ../web/index.html /var/www/html
sudo mkdir /var/www/html/downloads

echo "Creating logs..."
mkdir /home/steam/logs
ln -s /home/steam/.steam/logs/connection_log_2346.txt /home/steam/logs/connections.txt

echo "You should really reboot."
