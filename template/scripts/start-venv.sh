#!/bin/bash

cd ..

if [ ! -d "./venv" ]; then
    echo "Warning: venv not install"
    echo "Try install venv"

    python3 -m venv venv
    source ./venv/bin/activate

    ########### install packets ###########
    echo "Warning: scripts/start-venv.sh not set pip packets" && exit 1
    #pip install ultralytics

    ########### install packets ###########
else
    source ./venv/bin/activate
fi



if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Info: Virtual environment activated"
else
    echo "Error: Failed to activate virtual environment (try delete venv dir)"
    exit 1
fi