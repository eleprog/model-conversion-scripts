#!/bin/bash
set -e

. scripts/start-venv.sh

for file in models/*.pt; do
    python ./converters/pytorch2onnx/pytorch2onnx.py --model_path $file
done

exit 0