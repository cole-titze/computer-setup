#!/bin/bash
sudo snap install --classic code
sudo snap install pycharm-community --classic
ssh-keygen -t ed25519 -C "cole.titze@outlook.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
