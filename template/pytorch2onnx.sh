#!/bin/bash
set -e

. scripts/start-venv.sh
. converters/pytorch2onnx/convert.sh

exit 0