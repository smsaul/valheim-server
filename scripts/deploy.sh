#!/bin/bash


sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd

git clone https://github.com/smsaul/valheim-server.git \
          /home/steam/server

mkdir /home/steam/.config/unity3d/IronGate/Valheim/worlds

cp /home/steam/server/worlds/* \
   /home/steam/.config/unity3d/IronGate/Valheim/worlds

/home/steam/server/scripts/InstallUpdate.sh

sudo ufw allow 2346
sudo ufw allow 2347

sudo reboot