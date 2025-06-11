#!/bin/bash

if [ ! -d "./venv" ]; then
    echo "Warning: venv not install"
    echo "Try install venv"

    python3 -m venv venv
    source ./venv/bin/activate


    ########### set packets ###########
    echo "Warning: scripts/start-venv.sh not set pip packets"
    #pip install ultralytics
    ########### set packets ###########
fi


source ./venv/bin/activate

if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Info: Virtual environment activated"
else
    echo "Error: Failed to activate virtual environment (try delete venv dir)"
    exit 1
fi