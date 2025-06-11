#!/bin/bash

if [ ! -d "./venv" ]; then
    echo "Warning: venv not install"
    echo "Try install venv"

    python3 -m venv venv
    source ./venv/bin/activate
    pip install ultralytics
fi


source ./venv/bin/activate

if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Info: Virtual environment activated"
else
    echo "Error: Failed to activate virtual environment (try delete venv dir)"
    exit 1
fi