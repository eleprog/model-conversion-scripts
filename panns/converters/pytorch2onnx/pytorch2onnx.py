import argparse
from models import *

import torch
import torch.onnx


parser = argparse.ArgumentParser(description='Convert pytorch to onnx')

parser.add_argument('--sample_rate', type=int, default=32000)
parser.add_argument('--window_size', type=int, default=1024)
parser.add_argument('--hop_size', type=int, default=320)
parser.add_argument('--mel_bins', type=int, default=64)
parser.add_argument('--fmin', type=int, default=50)
parser.add_argument('--fmax', type=int, default=14000) 
parser.add_argument('--model_type', type=str, required=True)
parser.add_argument('--model_path', type=str, required=True)
#parser.add_argument('--audio_path', type=str, required=True)



args = parser.parse_args()


# Arguments & parameters
sample_rate = args.sample_rate
window_size = args.window_size
hop_size = args.hop_size
mel_bins = args.mel_bins
fmin = args.fmin
fmax = args.fmax
model_type = args.model_type
model_path = args.model_path
#audio_path = args.audio_path

device = torch.device('cpu')



classes_num = 3

# Model
Model = eval(model_type)
model = Model(sample_rate=sample_rate, window_size=window_size, 
    hop_size=hop_size, mel_bins=mel_bins, fmin=fmin, fmax=fmax, 
    classes_num=classes_num, freeze_base=True)

checkpoint = torch.load(model_path, map_location=device)
model.load_state_dict(checkpoint['model'])




# Создайте dummy-вход (размер зависит от архитектуры вашей модели)
#dummy_input = torch.randn(1, 1, sample_rate - (1024 // 2) * 2)  
dummy_input = torch.randn(1, sample_rate)

# Экспорт в ONNX
torch.onnx.export(
    model,
    dummy_input,
    "model.onnx",
    export_params=True,  # Сохранить веса в модели
    opset_version=13,    # Версия ONNX операторов
    do_constant_folding=True,  # Оптимизация констант
    input_names=["input"],     # Имена входных узлов
    output_names=["output"],   # Имена выходных узлов
    dynamic_axes={
        "input": {0: "batch_size"},  # Динамический размер батча
        "output": {0: "batch_size"}
    }
)
print("Экспорт завершен!")