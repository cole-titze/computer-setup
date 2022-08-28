## Initial Rpi Setup
```
sudo apt-get update && sudo apt-get upgrade 
sudo apt-get install git
```
```
git clone https://github.com/cole-titze/ComputerSetup.git
cd ComputerSetup/Rpi
chmod u+r+x *
source rpiSetup.sh
```
## [Add key to github](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
```
cat ~/.ssh/id_ed25519.pub
```
+ Copy output and put in new ssh key
## 
```
cd && rm -rf ComputerSetup
git clone git@github.com:cole-titze/ComputerSetup.git
~/ComputerSetup/Rpi source nhlDeploy.sh
```
# Add appsettings.Local.json for each repo
# Add with crontab -e
+ 0 0 * * * ~/Releases/Scripts/nhl-data-gatherer.sh
+ 0 0 * * * ~/Releases/Scripts/nhl-player-gatherer.sh