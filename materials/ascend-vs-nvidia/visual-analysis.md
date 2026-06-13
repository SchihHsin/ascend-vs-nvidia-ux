# 截图视觉解析 — 昇腾 vs NVIDIA 开发者门户

> 直接读图提取，覆盖 UX 关键触点。底层分数用于报告对比。

## 昇腾 — 01-ascend-home.png（首页 · 阶段1 认知导航）
场景：认知与导航
布局：浅色通透白底，信息密度中。顶部 CANN训练营 banner → "昇腾万里，让智能无所不及" 品牌标语 → 产品矩阵 → "从入门到成果" 成长路径 → 孵化/生态/解决方案多楼层。
色彩：蓝紫为主色，白底，渐变装饰，整体冷静克制。
组件：卡片网格、渐变 banner、产品 logo 墙。
交互信号：以"品牌叙事 + 产品罗列"为主，CTA 偏弱（主 CTA "立即注册登录社区"在底部）。
独特决策：首屏是**品牌愿景标语**而非开发者动作入口；"从入门到成果"成长路径是面向开发者的引导亮点。
首屏摩擦：开发者"我现在该点哪"的动作指引不强，需向下滚动寻找。
---

## NVIDIA — 01-nvidia-home.png（首页 · 阶段1 认知导航）
场景：认知与导航
布局：深色底，信息密度高。Hero "Skip the setup. Start building." → Tutorials 卡片 → Latest Releases 侧栏 → News → Training。
色彩：黑/深灰底 + NVIDIA 绿 (#76b900) 强调色，强对比。
组件：深色卡片、绿色 Read More 链接、右侧 Latest Releases 列表。
交互信号：Hero 文案直接是**开发者动作**（跳过配置、开始构建）；内容流是"教程/发布/新闻"资讯流。
独特决策：首屏即 cookie 同意弹窗遮挡 Hero（摩擦）；内容组织偏"开发者媒体/资讯门户"而非产品罗列。
首屏摩擦：cookie modal 首次落地遮挡主视觉；深色高密度对新手略压迫。
---

## 昇腾 — 02-ascend-download.png（下载中心 · 阶段4 资源获取）
场景：资源获取
布局：浅色，产品卡网格（CANN/PyTorch/TensorFlow/MindSpore/MindCluster/MindStudio）。落地即弹"资源下载中心公告" modal。
色彩：浅蓝白，产品 logo 彩色点缀。
组件：公告 modal（知道了）、产品下载卡、社区版/商用版分支。
交互信号：**落地被公告 modal 打断**；下载需选 CPU架构(AArch64/X86_64)+版本+软件包，并同意《CANN软件用户许可协议》。
独特决策：社区版 vs 商用版双轨；下载强调"配套资源/资源清单"概念。
摩擦：modal 打断 + 多级选择 + 协议同意；下载链路较长。
---

## NVIDIA — 02-nvidia-cuda-download.png（CUDA 下载 · 阶段4 资源获取）
场景：资源获取
布局：深色，中央经典"绿按钮"OS/架构/发行版/版本/安装类型矩阵选择器（被 modal 遮挡部分可见）。
色彩：深色 + 绿色按钮。
组件：**"Subscribe to NVIDIA CUDA Toolkit Updates"邮件捕获 modal**（First/Last name、Email、Location + Complete）；下方为分步绿按钮选择器。
交互信号：落地被邮件订阅 modal 打断（可关闭）；关闭后**无需登录**即可逐级点绿按钮选平台→直接拿安装命令/安装包。
独特决策：下载页底部直接给安装命令（inline）；Network/Full 两种安装包。
摩擦：邮件捕获 modal；但下载本身**零登录、步骤清晰**。
---

## 昇腾 — 03-ascend-modelzoo.png（ModelZoo · 阶段5 开发实践）
场景：开发实践 / 模型库
布局：浅色，DeepSeek专区 Hero → 大模型分类(LLM/Multimodal/大模型/MindSpeed) → "一站式模型开发与体验"含代码示例(Stable Diffusion) → 步骤流 01 SOTA模型/02 全流程开发工具/03 ModelShow。
色彩：蓝紫白，分类卡渐变。
组件：专区 Hero、分类卡、内联代码块、步骤时间线、ModelShow 入口。
交互信号：强调"一站式"全流程 + 可跑代码示例；结构清晰引导。
独特决策：DeepSeek 等热点专区前置；把"模型→工具→展示"做成引导式三步。
摩擦：低，引导较好。
---

## 昇腾 — 04-ascend-forum.png（论坛 · 阶段6 支持社区）
场景：支持与社区
布局：浅色，左侧分类导航栏（综合专区/Ascend C/CANN/MindSpore/MindStudio/ModelZoo/MindIE/Atlas 等）+ 中部帖子流 + 标签。
色彩：浅色，标签语义色。
组件：左侧目录树、"我要发帖"主按钮、帖子列表卡、标签、阅读/回复计数。
交互信号：标准 BBS 结构；按产品线分版；活跃帖可见。
独特决策：按昇腾产品线深度分版（颗粒度细）；发帖需登录（华为账号）。
摩擦：发帖/互动需登录华为账号；版块多、新手定位成本中。
---

## 昇腾 — 05-ascend-login.png（登录注册 · 阶段4 资源获取）
场景：注册与登录
布局：浅色，居中登录卡，大量留白。
色彩：浅灰白 + 红色 Ascend logo + 蓝色链接。
组件：**"华为账号登录"** 卡——手机号/邮箱/账号名 + 密码字段、短信验证码登录、登录按钮(禁用态灰)、注册|忘记密码、**微信+QQ 第三方登录**图标；底部 cookie 横幅。
交互信号：复用华为统一账号(Uniportal)；支持中国生态第三方(微信/QQ)。
独特决策：**绑定华为账号体系**——一个账号通昇腾/华为云等；面向中国开发者优化（手机号、短信、微信/QQ）。
摩擦：必须有/注册华为账号；海外开发者无微信/QQ，门槛偏高；登录是下载/社区/在线开发的闸门。
---

## NVIDIA — NGC 模型目录（缺图，见 failed-links.md）
场景：开发实践 / 模型库
来源：catalog.ngc.nvidia.com 导航 + WebFetch。
结构：NGC Catalog 聚合 容器/模型/Helm chart/资源；按 AI/HPC 等分类；部分资源需登录/接受协议。
独特决策：企业级模型与容器一站式目录，与 NIM/NeMo 打通。
（报告内用 mockup 复刻）
---

## NVIDIA — 开发者论坛（缺图，见 failed-links.md）
场景：支持与社区
来源：forums.developer.nvidia.com（Discourse）+ WebFetch。
结构：Discourse 论坛，按产品/平台分版（CUDA/Jetson/TensorRT 等），全球英文社区。
独特决策：全球化英文社区 + 官方工程师参与；与 Stack Overflow 生态交叉。
（报告内用 mockup 复刻）
---
