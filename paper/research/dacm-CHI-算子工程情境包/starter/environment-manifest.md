# 已知环境信息与待确认事实

## 已知

- 目标栈：Ascend C 自定义算子，后续计划接入 PyTorch / `torch_npu`。
- 算子原型：`AddCustom(x, y) -> z`，初始假设为 `float16` + `ND`。
- 真实工程应使用团队提供的 CANN 环境；本情境不提供该环境。

## 尚未给出，必须在真实环境核对

- NPU 型号和 `soc_version`；
- CANN 版本、驱动/固件版本；
- PyTorch 与 `torch_npu` 版本及 ABI 配套；
- 上游张量的实际 shape、dtype、format 与连续性；
- 可接受精度阈值、参考实现和测试数据；
- 工程最终采用简易 aclnn 路线还是完整自定义算子工程。
