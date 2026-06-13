# CLAUDE.md

本文件指导 Claude Code 在此目录工作。**用中文交流。**

## 这个目录是什么

**昇腾官网 vs 英伟达官网 · 开发者基础体验竞品分析**的工作区(由 competitive-analysis skill 产出)。视角 = **UX 体验旅程型**:以「开发者从第一次到官网到真正跑起来」为主线,把两边开发者门户拆成 **6 阶段 × 24 触点**,逐触点实跑取证、给差异分析 + 「昇腾该怎么做」改进建议,并按责任部门归堆。

> 原先寄居在 `../cann-dashboard/` 仓内,2026-06 拆出独立成项目(产出类型不同、截图素材几十 MB、生命周期独立)。**与 cann-dashboard 是两套独立东西**;只是沿用了它的浅色通透视觉皮肤。无构建系统、无后端、无依赖。

## 目录结构(沿用 skill 的数据层约定)

```
reports/
  ascend-vs-nvidia-2026-06-13-visual.html   ← 主交付物:单文件楼层滚动可视化报告
  ascend-vs-nvidia-2026-06-13-v1.md         ← Stage3 文字版报告(早期版,未含责任归属/最新取证计数)
materials/ascend-vs-nvidia/
  screenshots/        27 张真实截图 + 5 张「按重点裁」的区段图
  visual-analysis.md  截图视觉解析
  failed-links.md     取证失败/反爬记录
tracking/ascend-vs-nvidia.md   竞品跟踪表(旅程定义、进度)
```

## 用户旅程(已确认 · 6 阶段 24 触点)

1 认知与导航(首页第一屏 / 顶部导航·IA / 全站搜索 / 语言切换)· 2 产品探索选型(产品总览 / 产品详情 / 规格参数 / 解决方案)· 3 学习与文档(文档中心 / 快速入门 / 教程 / API参考)· 4 资源获取(下载中心 / **注册登录** / SDK流程 / 版本选择)· 5 开发实践(代码示例 / 模型库 / 开发工具 / 在线体验)· 6 支持与社区(社区论坛 / 技术支持 / FAQ / 博客)。

## 可视化报告结构(`...-visual.html`,单文件)

`<style>`(token + 组件) → `<body>`(topbar + 楼层容器 + lightbox) → `<script>`(数据 + 渲染)。楼层顺序:封面 → **用户旅程总览图**(6 阶段配对柱 + 情绪分曲线) → **24 触点热力图**(点行可跳触点) → **6 阶段楼层**(逐触点卡) → **末尾综述**(5 个判断各占一层 + 定制 Demo) → **行动建议**表(P0–P3) → **责任归属**楼层(6 部门归堆)。

### 触点卡结构(图文并茂,关键约定)

每卡 = 头(id + 双边评分药丸) + body 两列 + verdict。每列 = `who 标签 → 截图/mockup → 图下说明(adesc/ndesc)`;**图下紧跟一段"这张图里它怎么做"的文字**,不要图文分离。verdict = **差异分析**(完整句子 bullets,别写电报体) + **「昇腾该怎么做」rec**(独立高亮 callout,右挂「主责·部门」色标)。

### 数据与渲染(全在 `<script>` 内联,模拟+真实混合)

- `STAGES` / `TP`(24 触点:`{id,s,name,a,nv,aimg,atag,adesc,nm|nimg,ntag,ndesc,c:[[lab,txt]…],rec,win?}`)/ `JUDGES`(5 综述 + demo 类型)/ `ACTIONS`(P0–P3 表)。
- **`NV_REAL` 映射**:用户后补的 NVIDIA 真实整页截图 → 触点 id。渲染时 `nvimg=t.nimg||NV_REAL[t.id]`、`nvreal=...||!!NV_REAL[t.id]`;**再补 NVIDIA 真图只需在 `NV_REAL` 加一行**(文件丢进 screenshots/ + 加映射),无真图者自动落回 `nm` 描述的深色 mockup。
- **责任部门**:`DEPT_META`(6 部门:体验设计/资料/官网平台/产品/研发·工具链/社区运营,各带色)+ `DEPT_OF`(触点 id → 主责部门)。rec callout 与「责任归属」楼层都读它。**部门口径与 cann-dashboard 的「内部使用者」近似但不同**:这里多了「官网平台」(承接 登录/下载/URL/搜索),改归属只改 `DEPT_OF` 一行。
- 图表全自绘(纯 CSS + 内联 SVG,**无 ECharts**,离线可开):旅程柱/曲线、热力图、综述 Demo(hero/flow/matrix/path/discover)。
- `heatColor(s)`:<66 红 / <72 金 / <78 蓝 / ≥78 绿(问题优先)。

## 配色约定(品牌色)

- **昇腾 = 华为红 `#C7000B`,英伟达 = NVIDIA 绿 `#76B900`**(品牌色 + 评分语义统一用这两色)。改色时注意它们既是品牌色也是 good/bad 语义色,散落在 `:root` 变量、内联 hex、`heatColor` 字面量、JS gradient 里。
- 整体浅色通透 + 白卡柔阴影圆角(沿袭 cann-dashboard / IMG_3633 皮肤)。部门色另用紫/青/蓝/金/靛/粉,**不要**用红绿以免和品牌色混。

## 取证现状

真实截图 **19 张**(昇腾 9 · NVIDIA 10:home/cuda-download/cuda-toolkit/industries/docs/quickstart/ngc/build/forum/blog)——所有有独立页面的对比触点全覆盖。其余比较性论点(导航/搜索/Nsight/DLI 等无单一页面对应者)用标注 mockup。昇腾另有 5 张「按重点裁」的区段图(产品矩阵/Atlas规格/内联代码/开发工具/HiDevLab在线开发)+ 学习路径裁图。

## 踩过的坑(重要)

- **NVIDIA 站点对无头浏览器强反爬**:`developer.nvidia.com`/`docs`/`forums`/`catalog.ngc`/`build` 等子页,headless Chrome(含 `--headless=new` + 真实 UA + 关 AutomationControlled)多半返回空白。NVIDIA 真图基本靠**人工在真浏览器整页截**后丢进 screenshots/。
- **卡片缩略图只显示页面顶部**(`.shot{object-position:top}`):若文字讲的是页面中段模块(如学习路径、产品矩阵、内联代码),要用 `sips -c <h> <w> --cropOffset <Y> <X>` **裁出对应区段单独存图**,否则图文对不上。
- **class 命名别撞**:NVIDIA mockup 容器类是 `.mock`;标签曾误用 `class="tag mock"` → 被 `.mock{aspect-ratio:16/10}` 撑成大黄框。标签改用 `.tag.mk`。
- **页面很长(~2.8 万 px)**:无头截图验证要把 `--window-size` 高度开到 30000,再用 `sips` 裁带状区看局部。Chrome 偶发 exit 144 但文件已写出;多实例并发要各自 `--user-data-dir`。

## 查看与验证

```bash
open reports/ascend-vs-nvidia-2026-06-13-visual.html

# 无头整页截图(本报告纯 CSS/SVG,无需联网)
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
ud=$(mktemp -d); "$CHROME" --headless --disable-gpu --no-sandbox --hide-scrollbars \
  --user-data-dir="$ud" --window-size=1180,30000 --virtual-time-budget=9000 \
  --screenshot=/tmp/r.png "file://$(pwd)/reports/ascend-vs-nvidia-2026-06-13-visual.html"
# 裁局部:sips -c <高> <宽> --cropOffset <Y> <X> /tmp/r.png --out /tmp/tile.png
```

## 协作规则

- **用中文**交流。
- **视觉/设计类改动先提 2–4 个选项**让用户选(可用 AskUserQuestion),不要直接实现。
- **模拟数据先行**:缺真实结构时用模拟数据/标注 mockup 做成完整楼层,后续替换。
- 改完把新约定/坑同步进本文件;commit / push **等用户明确要求**再做(本项目未必已 git init,见下)。
```
# 若要独立成 git 仓:
git init && git add -A && git commit -m "init: 昇腾 vs 英伟达 官网体验竞品分析"
```
