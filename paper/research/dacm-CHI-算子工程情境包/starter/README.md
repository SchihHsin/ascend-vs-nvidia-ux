# AddCustom · 初始工程状态

你接手一个最小的逐元素加法算子工程。上游框架会传入两个同 shape 张量 `x`、`y`，期望得到 `z = x + y`。请像平时一样在自己的 IDE 或 CLI 中阅读、修改和推进它；目标是把工程推进到可在 PyTorch 中调用、并能在真实环境中验证的状态。

请先阅读：

- `add_custom.json`：算子原型和数据类型假设；
- `op_kernel/add_custom_kernel.cpp`：kernel 占位骨架；
- `op_host/add_custom_host.cpp`：host 侧占位接口；
- `environment-manifest.md`：已知与未知环境信息；
- `tests/test_add_custom_plan.py`：未来应建立的数值验证意图。

本目录不随附 CANN、PyTorch、NPU 或完整构建依赖。`study-run/` 中的本地脚本会给出连续的阶段线索；它们不是实际 NPU 编译或运行。不要把空缺直接补成“肯定可运行”的结论；请保留你查证资料、版本和现场事实的过程。
