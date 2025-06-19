#!/bin/bash
set -e

CONVERTER_NAME="$(basename "$PWD")"
MODEL_DIR="../../models"
MODEL_FORMAT="pt"

pushd "../../scripts"
    . start-venv.sh
popd

for file in $MODEL_DIR/*.$MODEL_FORMAT; do
    python $CONVERTER_NAME.py --model_path $file
done

exit 0