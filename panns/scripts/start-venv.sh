#!/bin/bash

cd ..

if [ ! -d "./venv" ]; then
    echo "Warning: venv not install"
    echo "Info: Try install venv"

    python3 -m venv venv
fi

source ./venv/bin/activate

if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Info: Check virtual environment dependency"
    pip install -q -r $1
    echo "Info: Virtual environment activated"
else
    echo "Error: Failed to activate virtual environment (try delete venv dir)"
    exit 1
fi