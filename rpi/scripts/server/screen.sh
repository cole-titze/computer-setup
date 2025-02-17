#!/bin/bash

# Define paths
WORK_DIR="~/computer-setup/rpi/scripts/screen"
VENV_DIR="$WORK_DIR/venv"
PYTHON_SCRIPT="$WORK_DIR/oled-stats.py"
LOG_FILE="$WORK_DIR/screen.log"

# Ensure required packages
sudo apt install -y python3 python3-venv python3-pip

# Create virtual environment if it doesn’t exist
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi

# Activate venv and install dependencies
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r "$WORK_DIR/requirements.txt"

# Run Python script and log output
python3 "$PYTHON_SCRIPT" >> "$LOG_FILE" 2>&1
deactivate



