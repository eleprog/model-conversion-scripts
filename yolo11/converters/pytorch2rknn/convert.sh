#!/bin/bash
set -e

pwd=$PWD

MODEL_DIR="../../models"
MODEL_FORMAT="pt"

pushd "../../scripts"
    . start-venv.sh $pwd/requirements.txt
    pip install rknn_toolkit2 --no-deps
popd

if [ ! -d "ultralytics_yolo11" ]; then
    git clone https://github.com/airockchip/ultralytics_yolo11.git
fi
if [ ! -d "rknn_model_zoo" ]; then
    git clone https://github.com/airockchip/rknn_model_zoo.git
fi

mkdir -p temp

for FILE in $MODEL_DIR/*.$MODEL_FORMAT; do
    MODEL_NAME_PYTORCH=$(basename "$FILE")
    MODEL_NAME_ONNX="${MODEL_NAME_PYTORCH%.*}.onnx"
    MODEL_NAME_RKNN="${MODEL_NAME_PYTORCH%.*}.rknn"

    # Конвертируем .pt в onnx оптимизированный для rknn
    cp $FILE temp
    pushd "ultralytics_yolo11"
        export PYTHONPATH=./
        sed -i "s|^model: .*|model: $pwd/temp/$MODEL_NAME_PYTORCH|" ./ultralytics/cfg/default.yaml  # Указываем путь к модели в конфиге ./ultralytics/cfg/default.yaml
        python ./ultralytics/engine/exporter.py
    popd

    # Конвертируем .pt в onnx оптимизированный для rknn
    pushd "rknn_model_zoo/examples/yolo11/python"
       python convert.py $pwd/temp/$MODEL_NAME_ONNX rk3588 fp $pwd/$MODEL_DIR/$MODEL_NAME_RKNN
    popd




    #python convert.py --model_path $file
done

exit 0