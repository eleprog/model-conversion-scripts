for file in models/*.pt; do
    python converters/pytorch2onnx/pytorch2onnx.py --model_path $file
done