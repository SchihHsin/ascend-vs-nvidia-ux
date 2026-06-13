# 截图失败记录

## NVIDIA — 无头浏览器强反爬（仅 2 页可截）
可截：`developer.nvidia.com/`（首页）、`developer.nvidia.com/cuda-downloads`（CUDA 下载）。
其余子页无头 Chrome 返回空白（已试 headless / headless=new + 真实 UA + 关闭 AutomationControlled，均空白）：

| 目标 | URL | 替代证据 |
|------|-----|---------|
| NGC 模型目录 | catalog.ngc.nvidia.com | WebFetch 文本 + mockup |
| 开发者论坛 | forums.developer.nvidia.com | WebFetch 文本 + mockup |
| CUDA Toolkit 产品页 | developer.nvidia.com/cuda-toolkit | WebFetch 文本（hero/Download Now/组件/链接）+ mockup |
| 文档中心 | docs.nvidia.com | WebFetch 文本（100+产品/主题·行业·角色筛选）+ mockup |
| CUDA 快速入门 | docs.nvidia.com/cuda/cuda-quick-start-guide | WebFetch 文本（分 OS/内联命令/版本选择器）+ mockup |
| 开发者博客 | developer.nvidia.com/blog | WebFetch 文本 + mockup |
| build playground | build.nvidia.com | WebFetch 超时；用已知功能描述 + mockup |

## 昇腾 — URL 猜测导致 404（已改用真实入口）
| 猜测 URL | 结果 | 真实入口 |
|---------|------|---------|
| hiascend.com/zh/solution | 404 | 顶部导航「解决方案」（行业解决方案楼层） |
| hiascend.com/blog | 404 | 「技术干货」/ 开发者中心博客区 |

> 注：昇腾 404 页本身干净（404 插画 + 返回首页 + 完整底部站点地图），见 06/08-ascend-solution/blog.png，作为「错误恢复」触点的正向证据保留。
> 补图方式：在有 GUI 的浏览器手动访问上述 NVIDIA URL 截图，替换 screenshots/ 下对应文件。
