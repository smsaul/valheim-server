#!/bin/sh 
export templdpath=$LD_LIBRARY_PATH  
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH  
export SteamAppID=892970

echo "Starting server PRESS CTRL-C to exit"  
/home/steam/valheim/valheim_server.x86_64 \
	-name "world" \
	-port 2456 \
	-nographics \
	-batchmode \
	-world "world" \
	-password "world" \ 
	-public 1 \
	>> /home/steam/logs/serverlog-$(date -I).txt
export LD_LIBRARY_PATH=$templdpath
