# Nerds

This is on a basic Ubuntu 22 server that uses `SteamCMD` and a custom script to download/update and run the game. It is available at the standard `2456` (game) and `2457` (steam query) unless otherwise informed.

## Prep

Create a user to run `steamcmd` (`adduser -m steam`), give it a password, and give it `sudo`.

Clone this repository onto `/home/steam`.

The public key for SSH access is in `valheim-server/auth`.

Execute all scripts as `steam`.

## Save Data Locations

Windows: `%userprofile%/AppData/LocalLow/IronGate/Valheim/Worlds`.

Ubuntu 22.04: `/home/steam/.config/unity3d/IronGate/Valheim/worlds_local`

Two files are required per world, the `.db` file containing the data and the `.fwl` file containing the world metadata.

Files are saved as good old `.zip` archives.

## Deployment

The non-privileged user to run the game is `steam`. The internal files are cloned from a GitHub repository to `/home/steam/valheim-server`. The game is installed to `/home/steam/valheim`.

It is run within `screen` rather than backgrounded because the intent is to automate a collection of views for status/troubleshooting quickly.

## Backups

The user can download a copy of the world at the point of the last update at any time. An Apache server facilitates this at `helsinki.valheim.saulnet.com/download`. 

## Logs

The `~/logs` directory contains a symlink to the connection log created by Steam and a server log text file.

Connection logs (Steam users): `~/logs/connections.txt`, symlink to `~/.steam/logs/connection_log_<port>.txt`

Server logs (game diag/errors): `~/logs/serverlog-<date>.txt`

## Upkeep

Run `scripts/valheim.sh` to start the server. It executes the game in a `screen` session.

### Updates

The game and the system are updated at a single time by running `scritps/SystemUpdate.sh`. An administrator should log into the game and save the world before running the utility, and should save the worlds archive on local storage before continuing the utility.

A system upgrade script backs up the worlds to the web `downloads` directory, updates the system, updates the game, and restarts the system. 

The game server must be brought up by the administrator after the update reboot.
