// 情境骨架：用于阅读和计划，不保证可直接编译。
// 参与者应据此识别还需查证的 Ascend C API、工程生成方式和硬件事实。

extern "C" __global__ void add_custom_kernel(
    const void* x, const void* y, void* z, unsigned long element_count) {
  // TODO: 在真实工程中，需要明确：
  // 1. 使用的 Ascend C Kernel / TPipe / GlobalTensor API；
  // 2. CopyIn -> Compute -> CopyOut 的数据搬运与计算；
  // 3. block 数、每核元素数与尾块处理；
  // 4. element_count 与输入 shape、dtype、format 的对应关系。
  //
  // 此处故意不填实现：本研究观察参与者怎样借助 Agent 和资料
  // 形成可验证的下一步，而非要求写出可运行 kernel。
  (void)x;
  (void)y;
  (void)z;
  (void)element_count;
}
