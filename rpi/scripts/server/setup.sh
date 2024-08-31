#!/bin/bash
# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# Add pi to docker group
sudo groupadd docker
sudo usermod -aG docker pi
newgrp docker

# Setup portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
# Create ssh key
ssh-keygen -t ed25519 -C "cole.titze@outlook.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

# Make backups directory
mkdir -p ~/backups/homeassistant

# Make models directory
sudo mkdir /var/llm-models