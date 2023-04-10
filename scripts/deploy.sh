#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd apache2

cd /home/steam && git clone https://github.com/smsaul/valheim-server.git

mkdir /home/steam/.config/unity3d/IronGate/Valheim/worlds_local

cp /home/steam/valheim-server/worlds/* \
   /home/steam/.config/unity3d/IronGate/Valheim/worlds_local

/home/steam/valheim-server/scripts/InstallUpdate.sh

sudo ufw allow 2346
sudo ufw allow 2347
sudo ufw allow 'Apache Full'

sudo cp /home/steam/valheim-server/web/index.html /var/www/html
sudo mkdir /var/www/html/downloads

mkdir /home/steam/logs
ln -s /home/steam/.steam/logs/connection_log_2346.txt connections.txt

sudo reboot