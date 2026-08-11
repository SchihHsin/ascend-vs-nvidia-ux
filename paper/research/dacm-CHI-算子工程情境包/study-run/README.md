# 本地阶段脚本

在项目根目录运行；macOS/Linux 示例：

```bash
chmod +x study-run/*.sh
./study-run/build.sh
```

脚本会把推进状态写入 `.study-state`（该文件不会进入 Git）。它们不调用 NPU、CANN 或网络，只输出研究情境预置的构建/运行线索。

建议推进顺序：

```bash
./study-run/build.sh
STUDY_SOC_VERSION=Ascend910B1 ./study-run/build.sh
./study-run/test_dynamic.sh
./study-run/configure_tiling.sh
./study-run/sanitize.sh
./study-run/inspect_launch.sh
./study-run/sanitize.sh --with-launch-context
./study-run/test_torch.sh
./study-run/check_versions.sh
./study-run/register_torch.sh
./study-run/test_accuracy.sh
```

研究者不应把这段顺序直接展示给参与者；它仅用于试点检查和需要时恢复现场。
