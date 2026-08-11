# CHI 协同研究 · AddCustom 连续工程情境包

这是给参与者发放的研究工程仓。参与者应下载后，在自己平时使用的 CLI 或 IDE（如 Terminal、VS Code、Cursor、PyCharm）中打开它，并使用自己常用的 AI 工具。工程沿既有算子开发时序推进：D 写 Kernel → M Tiling → X 编译/内存 → O 注册接入 → L 精度验收。

## 使用方式

1. 参与者在自己的环境中解压、打开本仓，先阅读 `starter/`，并在终端运行 `./study-run/build.sh`。
2. 每个 `study-run/` 脚本给出一段预置但真实风格的构建、运行或检查输出；参与者可查资料、问自己的 Agent、查看或修改工程文件，再继续执行下一命令。
3. 研究者通过录屏、访谈和参与者自愿提供的 Agent 对话记录过程。阶段材料只包含当前状态与线索，不提供标准答案。

本包不随附 CANN、PyTorch、NPU 或编译工具链。`study-run/` 运行的是本地脚本，用于复现阶段性的开发线索；它不是实际 NPU 编译或运行。代码、工程结构与终端操作则由参与者在自己的真实工具环境中完成。

## 工程结构

```text
starter/                         # 初始 AddCustom 工程骨架
  add_custom.json                # 算子原型：x/y/z，fp16，ND
  op_kernel/add_custom_kernel.cpp
  op_host/add_custom_host.cpp
  tests/test_add_custom_plan.py
  environment-manifest.md
study-run/                       # 可本地运行的阶段性脚本
  build.sh
  test_dynamic.sh
  sanitize.sh
  test_torch.sh
  test_accuracy.sh
  reset.sh
stage-01-kernel/                 # D：工程路线与 kernel 实现起点
stage-02-tiling/                 # M：shape / Tiling 约束
stage-03-compile-memory/         # X：预置编译/内存线索
stage-04-pytorch-integration/    # O：注册和版本线索
stage-05-accuracy/               # L：精度比对和验收边界
```

## 资料来源边界

阶段卡中的资料入口锚定既有 AI 可用性研究中使用的公开材料与任务口径。正式试点前，研究团队应将每个 URL 固定为可访问链接或静态快照，并记录访问日期、版本和替换原因。不要在材料中展示 AI 可用性评分、研究假设或“哪个节点更难”的判断。
