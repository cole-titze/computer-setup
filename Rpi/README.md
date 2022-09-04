## Initial Rpi Setup
```
sudo apt-get update && sudo apt-get upgrade 
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
# Add appsettings.Local.json for each repo
+ nhl-data-gatherer
```
cd ~/source/repos/nhl-data-gatherer/LocalRunning
nano appsettings.Local.json
```
+ nhl-player-gatherer
```
cd ~/source/repos/nhl-player-gatherer/nhl-player-trigger/LocalRunning
nano appsettings.Local.json
```
+ vegas-odds-getter
```
cd ~/source/repos/vegas-odds-getter
nano local.settings.json
```
# Add with crontab -e
+ 0 2 * * * ~/releases/Scripts/nhl-player-gatherer.sh
+ 0 3 * * * ~/releases/Scripts/nhl-data-gatherer.sh
+ 0 4 * * * ~/releases/Scripts/vegas-odds-getter.sh