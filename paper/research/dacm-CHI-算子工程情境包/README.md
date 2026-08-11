# CHI 协同研究 · AddCustom 连续工程情境包

这是给参与者发放的真实工程材料，不是任务说明的占位符。参与者从同一个 `AddCustom` 工程出发，按既有算子开发时序依次读取五个状态包：D 写 Kernel → M Tiling → X 编译/内存 → O 注册接入 → L 精度验收。

## 使用方式

1. 先发放根目录、`starter/` 和 `stage-01-kernel/`。
2. 参与者完成该节点的实施与验证计划后，再依序解锁下一个 `stage-*` 目录。
3. 每个阶段只提供当前工程状态、少量资料入口和现场线索；不提供标准答案或后续状态。

本包用于计划推演，不随附 CANN、PyTorch、NPU 或编译工具链。代码是最小化的工程上下文，目的是让参与者和 Agent 能据此讨论文件、接口、版本、日志和验证，而不是要求真实执行。

## 工程结构

```text
starter/                         # 初始 AddCustom 工程骨架
  add_custom.json                # 算子原型：x/y/z，fp16，ND
  op_kernel/add_custom_kernel.cpp
  op_host/add_custom_host.cpp
  tests/test_add_custom_plan.py
  environment-manifest.md
stage-01-kernel/                 # D：工程路线与 kernel 实现起点
stage-02-tiling/                 # M：shape / Tiling 约束
stage-03-compile-memory/         # X：预置编译/内存线索
stage-04-pytorch-integration/    # O：注册和版本线索
stage-05-accuracy/               # L：精度比对和验收边界
```

## 资料来源边界

阶段卡中的资料入口锚定既有 AI 可用性研究中使用的公开材料与任务口径。正式试点前，研究团队应将每个 URL 固定为可访问链接或静态快照，并记录访问日期、版本和替换原因。不要在材料中展示 AI 可用性评分、研究假设或“哪个节点更难”的判断。
