#!/bin/bash

# Give scripts executable permissions
cd ~/computer-setup/rpi/scripts && chmod -R u+r+x *

# Copy env files
cp -r ~/computer-setup/rpi/secrets ~/
