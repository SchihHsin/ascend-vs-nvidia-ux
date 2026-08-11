"""未来数值验证的意图，不依赖 NPU 或 torch_npu。"""

def reference_add(x, y):
    return [a + b for a, b in zip(x, y)]


TEST_CASES_TO_PREPARE = [
    {"shape": [8], "dtype": "float16", "purpose": "最小正常输入"},
    {"shape": [1024], "dtype": "float16", "purpose": "常规连续输入"},
    {"shape": "待确认的动态 shape", "dtype": "float16", "purpose": "后续 Tiling 边界"},
]

# 真实环境中还需要确定：比较方法、容差、随机种子、CPU/GPU 参考来源，
# 以及业务侧可接受误差阈值。本文件不执行任何算子。
