#!/bin/bash
cd ~/source/repos
git clone git@github.com:cole-titze/nhl-player-gatherer.git
git clone git@github.com:cole-titze/nhl-data-gatherer.git
git clone git@github.com:cole-titze/nhl-odds-web-backend.git
git clone git@github.com:cole-titze/vegas-odds-getter.git
cd
git clone git@github.com:cole-titze/Releases.git
cd Releases/Scripts && chmod u+r+x *
