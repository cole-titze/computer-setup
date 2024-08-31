#!/bin/bash
# Copy backups to new backup location
cp -a ~/../../var/homeassistant/backups/. ~/backups/homeassistant/

# Clean old backups location
sudo rm -rf ~/../../var/homeassistant/backups/*

# Keep 30 newest backups, delete others
cd ~/backups/homeassistant/
file_count=$(ls -t | wc -l)
if [ "$file_count" -gt 30 ]; then
    ls -t | tail -n +31 | xargs rm --
fi