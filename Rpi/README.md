## Initial Rpi Setup
```
sudo raspi-config
```
+ Set ssh to yes
+ Update hostname to deploypi
+ Change timezone
```
sudo apt-get update -y && sudo apt-get upgrade -y
```
## Set static ip
```
sudo nano /etc/dhcpcd.conf
```
+ Update hostname to deploypi
```
interface eth0
metric 300
static ip_address=192.168.1.19/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```
```
sudo reboot now
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
+ Copy output and put in new ssh key
## 
```
cd && rm -rf computer-setup
git clone git@github.com:cole-titze/computer-setup.git
cd computer-setup/Rpi/ && source nhlDeploy.sh
```
# Add environment variables for each repo
+ nhl-odds-web-backend
```
nano ~/secrets/.env-backend
```
+ nhl-data-getter
```
nano ~/secrets/.env-data-getter
```
+ nhl-data-cleaner
```
nano ~/secrets/.env-data-cleaner
```
+ vegas-odds-getter
```
nano ~/secrets/.env-vegas-getter
```
+ nhl-game-predictor
```
nano ~/secrets/.env-game-predictor
```
+ nhl-log-loss-getter
```
nano ~/secrets/.env-log-loss-getter
```
# Add with crontab -e
```
# Nightly Updates and docker cleaning
0 0 * * * /bin/bash ~/releases/Scripts/update.sh

# Nhl applications running four times a day
# 0 */6 * * * /bin/bash ~/releases/Scripts/vegas-odds-getter.sh

# Nhl applications: updating and running nightly
0 1 * * * /bin/bash ~/releases/Scripts/nhl-odds-web-backend.sh
0 1 * * * /bin/bash ~/releases/Scripts/nhl-odds-web-frontend.sh
0 2 * * * /bin/bash ~/releases/Scripts/nhl-data-getter.sh
0 3 * * * /bin/bash ~/releases/Scripts/nhl-data-cleaner.sh
0 4 * * * /bin/bash ~/releases/Scripts/nhl-game-predictor.sh
0 5 * * * /bin/bash ~/releases/Scripts/nhl-log-loss-getter.sh
```
# Database Deployment
+ This is not a polished process. Automating deploying mssql server to arm devices is not ideal, so most of this process is manual.
+ Connect to deployment server and update password in command and run:
```
sudo docker pull mcr.microsoft.com/azure-sql-edge:latest 
sudo docker run --restart=always --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=<YOUR PASSWORD>' -p 1433:1433 --name azuresqledge -d mcr.microsoft.com/azure-sql-edge
```
+ Connect to the database from Azure Data Studio (server name is your pi's ip no port is needed)
+ Run the database deploy script from the nhl-database repository
+ Run the table deploy script from the nhl-database repository
+ Run the team post-deploy script from the nhl-database repository
+ TODO: Backup process
