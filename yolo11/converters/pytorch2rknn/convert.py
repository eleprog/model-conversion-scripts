from pathlib import Path
import argparse
from ultralytics import YOLO

parser = argparse.ArgumentParser(description='Convert pytorch to onnx')
parser.add_argument('--model_path', type=str, required=True)
args = parser.parse_args()

model_dir_path = str(Path(args.model_path).parent)

# Load the YOLO11 model
model = YOLO(args.model_path)

# Export the model to RKNN format
# 'name' can be one of rk3588, rk3576, rk3566, rk3568, rk3562, rv1103, rv1106, rv1103b, rv1106b, rk2118
model.export(format="rknn", name="rk3588")  # creates '/yolo11n_rknn_model'
