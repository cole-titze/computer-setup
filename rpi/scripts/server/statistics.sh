#!/bin/bash

# Define paths
WORK_DIR="$(dirname "$(realpath "$0")")"
VENV_DIR="$WORK_DIR/venv"
PYTHON_SCRIPT="$WORK_DIR/oled_stats.py"
LOG_FILE="$WORK_DIR/oled.log"

# Update system and install required packages
sudo apt update && sudo apt install -y python3 python3-venv python3-pip

# Create virtual environment if it doesn’t exist
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi

# Activate venv and install dependencies
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r "$WORK_DIR/requirements.txt"
deactivate

# Add cron job to start script at boot (if not already added)
CRON_JOB="@reboot /bin/bash -c 'cd $WORK_DIR && source $VENV_DIR/bin/activate && python3 $PYTHON_SCRIPT >> $LOG_FILE 2>&1 &'"
(crontab -l 2>/dev/null | grep -Fv "$PYTHON_SCRIPT"; echo "$CRON_JOB") | crontab -

echo "Setup complete! The script will run on startup."