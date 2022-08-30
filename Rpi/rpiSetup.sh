#!/bin/bash
# Install dotnet
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.dotnet' >> ~/.bashrc
source ~/.bashrc
# Install pyodbc
sudo apt-get install python3-dev unixodbc-dev
git clone https://github.com/mkleehammer/pyodbc
cd pyodbc
python3 setup.py build
sudo python3 setup.py install
cd && rm -rf pyodbc
# Create ssh key
ssh-keygen -t ed25519 -C "cole.titze@outlook.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub