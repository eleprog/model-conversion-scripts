#!/bin/bash
set -e

. scripts/start-venv.sh

for file in models/*.onnx; do
    python ./converters/onnx2rknn/onnx2rknn.py --model_path $file
done

exit 0