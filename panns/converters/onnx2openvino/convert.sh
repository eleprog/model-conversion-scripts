#!/bin/bash
set -e

pwd=$PWD

CONVERTER_NAME="$(basename "$pwd")"
MODEL_DIR="../../models"
MODEL_FORMAT="onnx"

pushd "../../scripts"
    . start-venv.sh $pwd/requirements.txt
popd

for file in $MODEL_DIR/*.$MODEL_FORMAT; do
    echo $file
    mo --input_model $file --output_dir $MODEL_DIR/openvino
done

exit 0