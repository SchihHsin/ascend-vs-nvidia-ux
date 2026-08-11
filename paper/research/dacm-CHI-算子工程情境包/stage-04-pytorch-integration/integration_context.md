# 已知接入线索

```text
目标调用体验：torch.ops.addcustom.add(x, y)
候选绑定方式：TORCH_LIBRARY / TORCH_LIBRARY_IMPL / PYBIND11_MODULE / 调用自动生成的 aclnn 接口
项目 Python 侧：PyTorch 2.x（未锁定小版本）
NPU 插件：torch_npu（未锁定版本）
CANN：由团队环境提供（未锁定版本）
```

尚未给出：ABI 要求、编译器、Python 版本、是否已生成 aclnn 接口、最终注册文件位置、真实版本配套表。

请说明哪些问题可先靠资料回答，哪些必须在工程环境中核对。
