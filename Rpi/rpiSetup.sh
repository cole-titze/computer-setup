#!/bin/bash
sudo apt install code
#sudo snap install pycharm-community --classic       // no arm build
ssh-keygen -t ed25519 -C "cole.titze@outlook.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
