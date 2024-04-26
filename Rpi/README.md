## Initial Rpi Setup

```
sudo raspi-config
```

- Set ssh to yes
- Update hostname to deploypi
- Change timezone

```
sudo apt-get update -y && sudo apt-get upgrade -y
```

## Set static ip
+ If you run the vpn it will set up a static ip address for you

+ Otherwise before bullseye this works:
```
sudo nano /etc/dhcpcd.conf
```

- Update hostname to deploypi

```
interface eth0
metric 300
static ip_address=10.0.0.19/24
static routers=10.0.0.1
static domain_name_servers=10.0.0.1
```

```
sudo reboot now
```

## Add custom bash commands
```
sudo nano /root/.bashrc
```
+ Add custom shutdown and restart to give time for docker containers to stop
```
# Custom shutdown and restart commands
alias shutdown='sudo docker stop -t 600 $(docker ps -a -q) && echo "Docker containers have been stopped." && sudo shutdown'
alias reboot='sudo docker stop -t 600 $(docker ps -a -q) && echo "Docker containers have been stopped." && sudo reboot'
alias dockerstop='sudo docker stop -t 600 $(docker ps -a -q) && echo "Docker containers have been stopped."'
```


## Install git and clone repos

```
sudo apt-get install git -y
git clone https://github.com/cole-titze/computer-setup.git
cd computer-setup/Rpi
chmod u+r+x *
source rpiSetup.sh
```

## [Add key to github](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

- Copy output and put in new ssh key

##

```
cd && rm -rf computer-setup
git clone git@github.com:cole-titze/computer-setup.git
cd computer-setup/Rpi/ && source nhlDeploy.sh
```

# Add with crontab -e

```
# Constant updates
# <VPN setup will add script here>

# Nightly Updates and docker cleaning
0 0 * * * /bin/bash ~/releases/Scripts/update.sh
0 1 * * * /bin/bash ~/releases/Scripts/containers/pi-hole.sh
0 1 * * * /bin/bash ~/releases/Scripts/containers/portainer.sh
0 1 * * * /bin/bash ~/releases/Scripts/containers/home-assistant.sh
0 1 * * * /bin/bash ~/releases/Scripts/containers/magic-mirror.sh
```

# [Setup VPN](https://www.duckdns.org/)

- Login to get easy install directions
- Follow the steps under "Install"
- Port forward pi's ip (10.0.0.19:51820)
- Download and run pivpn setup

```
curl -L https://install.pivpn.io | bash
```
- During install use the duckdns domain instead of an ip (<domain>.duckdns.org)
- Download wireguard app and scan qr from

```
pivpn add
pivpn -qr
```

- [Pivpn Docs](https://docs.pivpn.io/wireguard)

# [Restore HomeAssistant]([https://www.home-assistant.io/integrations/backup/](https://www.home-assistant.io/common-tasks/os/#restoring-a-backup))



## Nhl Setup
+ If you want to run the nhl project, use this section

# Add environment variables for each repo

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

# Add with crontab -e

```
# Nhl applications running four times a day
# 0 */6 * * * /bin/bash ~/releases/Scripts/nhl-vegas-odds-getter.sh

# Nhl applications: updating and running nightly
0 1 * * * /bin/bash ~/releases/Scripts/nhl/nhl-odds-web-backend.sh
0 1 * * * /bin/bash ~/releases/Scripts/nhl/nhl-odds-web-frontend.sh
0 2 * * * /bin/bash ~/releases/Scripts/nhl/nhl-data-getter.sh
0 3 * * * /bin/bash ~/releases/Scripts/nhl/nhl-data-cleaner.sh
0 4 * * * /bin/bash ~/releases/Scripts/nhl/nhl-bookmaker-odds-getter.sh
0 5 * * * /bin/bash ~/releases/Scripts/nhl/nhl-game-predictor.sh
0 6 * * * /bin/bash ~/releases/Scripts/nhl/nhl-log-loss-getter.sh
```


# Database Deployment

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
