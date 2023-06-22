#!/bin/bash
# Create release directory
cd
git clone git@github.com:cole-titze/releases.git
cd ~/releases/Scripts && chmod u+r+x *
cd ~/releases/Scripts/containers && chmod u+r+x *
cd ~/releases/Scripts/nhl && chmod u+r+x *

# Copy env files
cp -r ~/computer-setup/Rpi/secrets ~/