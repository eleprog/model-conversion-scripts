#!/bin/bash
set -e

CONVERTER_NAME="$(basename "$PWD")"
MODEL_DIR="../../models"
MODEL_FORMAT="pth"

pushd "../../scripts"
    . start-venv.sh
popd

for file in $MODEL_DIR/*.$MODEL_FORMAT; do
    python $CONVERTER_NAME.py --model_path $file --model_type Transfer_Cnn14
done

exit 0