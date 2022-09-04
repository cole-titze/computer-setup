#!/bin/bash
cd ~/source/repos
git clone git@github.com:cole-titze/nhl-player-gatherer.git
git clone git@github.com:cole-titze/nhl-data-gatherer.git
git clone git@github.com:cole-titze/nhl-odds-web-backend.git
git clone git@github.com:cole-titze/vegas-odds-getter.git
# Install python requirements
cd ~/source/repos/vegas-odds-getter/
pip3 install -r requirements.txt
# Create release directory
cd
git clone git@github.com:cole-titze/releases.git
cd ~/releases/Scripts && chmod u+r+x *
export PYTHONPATH="${PYTHONPATH}:~/releases/vegas-odds-getter"