// 情境骨架：host 侧调用路径尚未绑定到真实 CANN 运行时。

struct AddCustomLaunchConfig {
  unsigned long element_count;
  unsigned int block_dim;
  const char* soc_version;
};

int LaunchAddCustom(const void* x, const void* y, void* z,
                    const AddCustomLaunchConfig& config) {
  // TODO: 真实工程需要确定生成工程的目录与接口、kernel launch 方式、
  // stream/context 的来源，以及 config 中哪些字段来自环境而非文档。
  (void)x;
  (void)y;
  (void)z;
  (void)config;
  return -1;  // 仅表示“尚未接入”，不是实际报错码。
}
