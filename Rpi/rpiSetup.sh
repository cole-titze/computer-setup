#!/bin/bash
# Install dotnet
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.dotnet' >> ~/.bashrc
source ~/.bashrc
# Install pip and odbc
sudo apt-get install python3-pip freetds-dev freetds-bin libssl-dev
# Create ssh key
ssh-keygen -t ed25519 -C "cole.titze@outlook.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub