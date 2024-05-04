#!/bin/bash
# Create release directory
cd
git clone git@github.com:cole-titze/releases.git
cd ~/releases/scripts && chmod u+r+x *
cd ~/releases/scripts/containers && chmod u+r+x *
cd ~/releases/scripts/nhl && chmod u+r+x *

# Copy env files
cp -r ~/computer-setup/Rpi/secrets ~/