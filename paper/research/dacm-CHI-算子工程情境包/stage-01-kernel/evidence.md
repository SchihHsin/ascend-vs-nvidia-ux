# D · 可查看的公开资料入口

以下是资料入口，不是标准答案。研究团队在正式试点前需检查其可访问性，必要时以页面快照替代。

| 用途 | 公开入口 | 参与者需要判断什么 |
|---|---|---|
| Ascend C 自定义算子工程生成 | `msopgen gen` 相关官方教程/样例 | 生成工程需要哪些参数，`soc_version` 从哪里来 |
| 算子原型 | `add_custom.json` 相关官方样例 | dtype/format/输入输出描述如何影响后续文件 |
| kernel 实现 | Ascend C 自定义算子 how-to / 示例 | CopyIn、Compute、CopyOut 分别要落实到什么代码与 API |
| 工程经验 | 公开 Ascend C AddCustom 教程或样例仓 | 哪些步骤只是经验线索，仍需用官方资料或现场事实核对 |

建议检索词：`Ascend C AddCustom msopgen add_custom.json`、`Ascend C 自定义算子 kernel CopyIn Compute CopyOut`。

不要预先告诉参与者某一页面是否可被 Agent 读取；这正是过程观察的一部分。
