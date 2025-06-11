from pathlib import Path
import argparse
from ultralytics import YOLO


parser = argparse.ArgumentParser(description='Convert pytorch to onnx')
parser.add_argument('--model_path', type=str, required=True)
args = parser.parse_args()

model_dir_path = str(Path(args.model_path).parent)

print(args.model_path)
# Load the YOLO11 model
model = YOLO(args.model_path)

# Export the model to ONNX format
model.export(format="onnx")  # creates 'yolo11n.onnx'

# Load the exported ONNX model
onnx_model = YOLO(model_dir_path + "/yolo11s-visdrone.onnx")

# Run inference
results = onnx_model("https://ultralytics.com/images/bus.jpg",  save=True)