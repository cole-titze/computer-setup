## Initial Rpi Setup
```
sudo apt-get update -y && sudo apt-get upgrade -y
```
## Set static ip
```
sudo nano /etc/dhcpcd.conf
```
+ Update hostname to given hostname
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
mkdir source
mkdir source/repos
git clone git@github.com:cole-titze/computer-setup.git
cd computer-setup/Rpi/ && source nhlDeploy.sh
```
# Add environment variables for each repo
+ github packages read token
```
nano ~/secrets/.github_pat
```
+ nhl-odds-web-backend
```
nano ~/secrets/.env-backend
```
+ nhl-data-gatherer
```
nano ~/secrets/.env-data-getter
```
+ nhl-player-gatherer
```
nano ~/secrets/.env-player-getter
```
+ nhl-game-predictor
```
nano ~/secrets/.env-game-predictor
```
+ vegas-odds-getter
```
nano ~/secrets/.env-vegas-getter
```
# Add with crontab -e
```
# Nhl applications running four times a day
0 */6 * * * /bin/bash ~/releases/Scripts/vegas-odds-getter.sh
# Nhl applications: updating and running nightly
0 0 * * * /bin/bash ~/releases/Scripts/nhl-odds-web-backend.sh
0 0 * * * /bin/bash ~/releases/Scripts/nhl-predictor-frontend-react.sh
0 2 * * * /bin/bash ~/releases/Scripts/nhl-player-gatherer.sh
0 3 * * * /bin/bash ~/releases/Scripts/nhl-data-gatherer.sh
0 5 * * * /bin/bash ~/releases/Scripts/vegas-odds-getter.sh
0 6 * * * /bin/bash ~/releases/Scripts/nhl-game-predictor.sh
# Monthly Updates and docker cleaning
0 23 1 * * /bin/bash ~/releases/Scripts/update.sh
```