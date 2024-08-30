#!/bin/bash

# Give scripts executable permissions
cd ~/computer-setup/scripts && chmod -r u+r+x *

# Copy env files
cp -r ~/computer-setup/rpi/secrets ~/