#!/bin/bash
set -e

pwd=$PWD

MODEL_DIR="../../models"
MODEL_FORMAT="onnx"

pushd "../../scripts"
    . start-venv.sh $pwd/requirements.txt
popd

for file in $MODEL_DIR/*.$MODEL_FORMAT; do
    python convert.py --model_path $file
done

exit 0