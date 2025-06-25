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
    ovc $file --output_model $MODEL_DIR/openvino --compress_to_fp16=False
done

exit 0