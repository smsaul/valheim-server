#!/bin/bash


#Backup worlds

cd /home/steam/.config/unity3d/IronGate/Valheim/worlds_local && sudo zip /var/www/html/downloads/worlds-$(date -I).zip *

#tar -cvf /var/www/html/downloads/worlds-$(date -I).tar /home/steam/.config/unity3d/IronGate/Valheim/worlds_local

#Prompt to continue after files are copied (Press any key...)

read -p 'Press Enter once the worlds are saved elsewhere...' input

#Update system

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

#Update game

/home/steam/src/valheim-server/scripts/InstallUpdate.sh

#Reboot

read -p 'Press Enter to reboot...' input

sudo reboot
