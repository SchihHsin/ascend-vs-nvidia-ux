# AddCustom · 初始工程状态

你接手一个最小的逐元素加法算子工程。上游框架会传入两个同 shape 张量 `x`、`y`，期望得到 `z = x + y`。当前目标是规划：如何从工程骨架走到可在 PyTorch 中调用、并能在真实环境中验证的自定义算子。

请先阅读：

- `add_custom.json`：算子原型和数据类型假设；
- `op_kernel/add_custom_kernel.cpp`：kernel 占位骨架；
- `op_host/add_custom_host.cpp`：host 侧占位接口；
- `environment-manifest.md`：已知与未知环境信息；
- `tests/test_add_custom_plan.py`：未来应建立的数值验证意图。

本目录没有完整构建配置，也没有可运行依赖。不要把空缺直接补成“肯定可运行”的命令；应说明需要查证的资料、版本和现场事实。
