#!/bin/bash
# Copy env files
cp ~/computer-setup/secrets ~/
# Create release directory
cd
git clone git@github.com:cole-titze/releases.git
cd ~/releases/Scripts && chmod u+r+x *