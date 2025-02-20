# Initial Rpi Setup
+ See the ansible repo for easy setup

## Add with crontab -e

```
# Constant updates
# VPN setup will add script here, an example:
*/5 * * * * ~/duckdns/duck.sh >/dev/null 2>&1

# Nightly Updates and docker cleaning
0 3 * * * /bin/bash ~/computer-setup/rpi/scripts/containers/magic-mirror.sh
0 3 * * * /bin/bash ~/computer-setup/rpi/scripts/containers/esphome.sh
0 4 * * * /bin/bash ~/computer-setup/rpi/scripts/containers/llm-web-backend.sh

# Create backups
0 5 * * * /bin/bash ~/computer-setup/rpi/scripts/backups/home-assistant.sh

# Start rpi statistics screen
0 6 * * * /bin/bash ~/computer-setup/rpi/scripts/server/screen.sh
```
---

# [Setup VPN](https://www.duckdns.org/)

- Login to get easy install directions (github)
- Follow the steps under "Install"
- Port forward pi's ip (10.0.0.19:51820)
- Download and run pivpn setup

```
curl -L https://install.pivpn.io | bash
```
## During Install
- Use pi ip (10.0.0.19) for DNS ip
- Use the duckdns domain instead of an ip (<domain>.duckdns.org)
- Download wireguard app and scan qr from

```
pivpn add
pivpn -qr
```

- [Pivpn Docs](https://docs.pivpn.io/wireguard)

---

# Home Assistant

## [Backup HomeAssistant](https://www.home-assistant.io/integrations/backup/)

- To get backups to another computer (run from computer with cloud backups):

```
scp pi@10.0.0.19:"~/backups/homeassistant/*" ~/Desktop/HA_Backups
```

- If you already have backups running you can skip to the Restore section
- Add the automation (Settings -> Automations & Scenes -> Create Automation -> <Three dots> -> Edit in yaml
- Add the automation:

```
trigger:
  platform: time
  at: "03:00:00"
action:
  alias: "Create backup now"
  service: backup.create
```

- This saves files to the homeAssistant config folder (/var/homeassistant/backups/)

## [Restore HomeAssistant](https://www.home-assistant.io/integrations/backup/#restoring-a-backup)

- Get your backups onto the pi (run from computer with cloud backups):

```
scp -p ~/Desktop/HA_Backups/* pi@10.0.0.19:"~/backups/homeassistant"
```

- Run the restore command (config is held in var which needs super user permissions):

```
cd ~/../../var/
mkdir homeassistant
cd ~/backups/homeassistant
sudo su
tar -xOf $(ls -Art | tail -n 1) "./homeassistant.tar.gz" | tar --strip-components=1 -zxf - -C ~/../../var/homeassistant
```

## Add LLM
+ The llama docker container will attempt to use a model in the following location: /var/llm-models/model.gguf
+ The directory is created through the setup scripts, so just move your model to the rpi's folder
```
scp <your-model.gguf> pi@deploypi:/var/llm-models/model.gguf
```

---

# Nhl Setup

- If you want to run the nhl project, use this section

## Add environment variables for each repo

- nhl-odds-web-backend

```
nano ~/secrets/.env-backend
```

- nhl-data-getter

```
nano ~/secrets/.env-data-getter
```

- nhl-data-cleaner

```
nano ~/secrets/.env-data-cleaner
```

- nhl-bookmaker-odds-getter

```
nano ~/secrets/.env-vegas-getter
```

- nhl-game-predictor

```
nano ~/secrets/.env-game-predictor
```

- nhl-log-loss-getter

```
nano ~/secrets/.env-log-loss-getter
```

## Add with crontab -e

```
# Nhl applications running four times a day
# 0 */6 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-vegas-odds-getter.sh

# Nhl applications: updating and running nightly
0 1 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-odds-web-backend.sh
0 1 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-odds-web-frontend.sh
0 2 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-data-getter.sh
0 3 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-data-cleaner.sh
0 4 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-bookmaker-odds-getter.sh
0 5 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-game-predictor.sh
0 6 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-log-loss-getter.sh
```

## Database Deployment

- This is not a polished process. Automating deploying mssql server to arm devices is not ideal, so most of this process is manual.
- Connect to deployment server and update password in command and run:

```
sudo docker pull mcr.microsoft.com/azure-sql-edge:latest
sudo docker run --restart=always --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=<YOUR PASSWORD>' -p 1433:1433 --name azuresqledge -d mcr.microsoft.com/azure-sql-edge
```

- Connect to the database from Azure Data Studio (server name is your pi's ip no port is needed)
- Run the database deploy script from the nhl-database repository
- Run the table deploy script from the nhl-database repository
- Run the team post-deploy script from the nhl-database repository
- TODO: Backup process
