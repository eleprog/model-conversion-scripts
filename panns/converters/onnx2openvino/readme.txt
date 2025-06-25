После конвертации рантайм openvino выдаёт ошибку: 

Check 'm_min <= m_max' failed at src/core/src/op/clamp.cpp:116:
While validating node 'opset1::Clamp Clamp_65 (/base/logmel_extractor/MatMul[0]:f32[1,1,501,64]) -> ()' with friendly_name 'Clamp_65':
Attribute 'min' must be less or equal than 'max'. Got: 1e-10 and 0

В случае с fp32 решается заменой "inf" на 3.4028235e38