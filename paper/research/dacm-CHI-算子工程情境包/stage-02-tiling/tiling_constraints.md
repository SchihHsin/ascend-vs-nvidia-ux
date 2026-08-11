# 已知约束

```text
case A: shape=[1024], dtype=float16, 连续 ND
case B: shape=[65536], dtype=float16, 连续 ND
case C: shape=[N], N 在运行时给出，可能不是单个 block 的整数倍
```

尚未给出：实际 `soc_version`、可用 core 数、UB 容量、目标 block_dim、性能目标、是否需要 double buffer。

这些未知不是“缺题”，而是进入真实环境后必须被确认的事实。参与者应说明会如何取得它们，而不是自行假定数值。
