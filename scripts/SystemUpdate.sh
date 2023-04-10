#!/bin/bash


#Backup worlds
tar -cvf worlds-$(date -I).tar /home/steam/.config/unity3d/IronGate/Valheim/worlds/helsinki.*

chmod 777 worlds$(date -I).tar

#Prompt to continue after files are copied (Press any key...)

read -p 'Press Enter once the worlds are saved elsewhere...' input

#Update system

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

#Update game

/home/steam/scripts/InstallUpdate.sh

#Reboot

sudo reboot
