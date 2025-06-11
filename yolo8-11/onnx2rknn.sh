#!/bin/bash
set -e

. scripts/start-venv.sh
. converters/onnx2rknn/convert.sh

exit 0