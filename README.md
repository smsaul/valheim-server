## Save Data Locations

Windows: `%userprofile%/AppData/LocalLow/IronGate/Valheim/Worlds`.

Ubuntu 22.04: `/home/steam/.config/unity3d/IronGate/Valheim/worlds_local`

Two files are required per world, the `.db` file containing the data and the `.fwl` file containing the world metadata.

A script to copy to Windows and Linux user's systems are available for those who don't use custom file locations. If you already have a copy, **it will be overwritten**.

## Nerds

This is on a basic Ubuntu 22 server that uses `SteamCMD` and a custom script to download/update and run the game. It is available at the standard `2456` (game) and `2457` (steam query) unless otherwise informed.

### Deployment

The non-priviledged user to run the game is `steam`. The internal files are cloned from a GitHub repository to `/home/steam/valheim-server`. The game is installed to `/home/steam/valheim`.

It is run within `screen` rather than backgrounded because the intent is to automate a collection of views for status/troubleshooting quickly.

### Backups

The user can download a copy of the world at any time. An Apache server facilitates this at `helsinki.valheim.saulnet.com/download`. 

### Logs

The `~/logs` directory contains a symlink to the connection log created by Steam and a server log text file.

Connection logs (Steam users): `~/logs/connections.txt`, symlink to `~/.steam/logs/connection_log_<port>.txt`

Server logs (game diag/errors): `~/logs/serverlog-<date>.txt`

The server can be stopped by pressing `CTRL-C`.

### Upkeep

The game can be updated and started by executing the scripts in `/home/steam/valheim-server/scripts`, `SystemUpdate.sh` and `StartServer.sh` (a symlink to the file located in the game directory).

A system upgrade script backs up the worlds, updates the system, updates the game, and restarts the system. The game server must be brought up by the user.