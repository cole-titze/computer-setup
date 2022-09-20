## Initial Rpi Setup
```
sudo apt-get update && sudo apt-get upgrade
```
# Set static ip
```
sudo nano /etc/dhcpcd.conf
```
```
interface eth0
metric 300
static ip_address=192.168.1.19/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```
```
sudo reboot now
sudo apt-get install git
```
```
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
nano ~/secrets/github_pat
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
0 2 * * * /bin/bash ~/releases/Scripts/nhl-player-gatherer.sh
0 3 * * * /bin/bash ~/releases/Scripts/nhl-data-gatherer.sh
0 4 * * * /bin/bash ~/releases/Scripts/vegas-odds-getter.sh
0 5 * * * /bin/bash ~/releases/Scripts/vegas-odds-getter.sh
0 6 * * * /bin/bash ~/releases/Scripts/nhl-game-predictor.sh
0 0 * * * /bin/bash ~/releases/Scripts/nhl-odds-web-backend.sh
0 0 * * * /bin/bash ~/releases/Scripts/nhl-predictor-frontend-react.sh
```