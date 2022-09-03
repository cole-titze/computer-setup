## Initial Rpi Setup
```
sudo apt-get update && sudo apt-get upgrade 
sudo reboot now
sudo apt-get install git
```
```
git clone https://github.com/cole-titze/ComputerSetup.git
cd ComputerSetup/Rpi
chmod u+r+x *
source rpiSetup.sh
```
## [Add key to github](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
+ Copy output and put in new ssh key
## 
```
cd && rm -rf ComputerSetup
mkdir source
mkdir source/repos
git clone git@github.com:cole-titze/ComputerSetup.git
cd ComputerSetup/Rpi/ && source nhlDeploy.sh
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
+ VegasOddsGetter (Update driver to FreeTDS)
```
cd ~/source/repos/VegasOddsGetter
nano local.settings.json
```
+ Create FreeTDS driver
```
sudo nano /etc/odbcinst.ini
```
```
[FreeTDS]
Description = FreeTDS unixODBC Driver
Driver = /usr/lib/aarch64-linux-gnu/odbc/libtdsodbc.so
Setup = /usr/lib/aarch64-linux-gnu/odbc/libtdsodbc.so
UsageCount = 1
```
# Add with crontab -e
+ 0 1 * * * ~/Releases/Scripts/nhl-data-gatherer.sh
+ 0 0 * * * ~/Releases/Scripts/nhl-player-gatherer.sh