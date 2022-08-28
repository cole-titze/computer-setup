# Scripts for Rpi
```
sudo apt-get update && sudo apt-get upgrade 
sudo apt-get install git
sudo apt install snapd
sudo reboot now
sudo snap install core
```
```
git clone https://github.com/cole-titze/ComputerSetup.git
cd ComputerSetup/Rpi
chmod u+r+x *
source rpiSetup.sh
```
## [Add key to github](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
+ copy contents of ~/.ssh/id_ed25519.pub to github public ssh keys in settings
```
cd && rm -rf StartupScripts
git clone git@github.com:coleTitze/StartupScripts.git
```
