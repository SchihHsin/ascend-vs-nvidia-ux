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

## 用户旅程(v2 重构 · 7 步生命周期 + 2 场景 tab)

> **重大重构(2026-06)**:把旧的「6 假阶段」(认知/选型/学习/获取/开发/支持——其实是几个**并行用法**,不是先后旅程,导致维度老错位)换成**开发者为一个真实目标走的 7 步生命周期**,并支持**两条场景线**(顶部 tab 切换)。

**7 步生命周期**(`STEPS`,id `L1..L7`):1 落地·找入口·选型 → 2 上手引导 → 3 配环境·拿SDK → 4 动手写·查文档 → 5 编译跑通 → 6 调试·求助 → 7 进阶·跟生态(有经验后)。
- **两条场景**(`SCEN`,顶部 `#scenTabs` 切换 `setScen('op'|'train')`):**算子开发**(主场景,已建)/ **训练**(建设中占位)。切 tab 同时重渲染 旅程/热力图/楼层。
- **旧 24 触点全部保留、按 `STEP_MAP[scen]` 映射到 7 步**(深+广两级:步骤=粗、触点卡=细)。映射:L1{1.1,1.2,2.1,2.3,2.4} L2{2.2,3.2,3.3,5.4} L3{4.1,4.2,4.3,4.4} L4{3.1,3.4,5.1} L5{5.3} L6{6.1,6.2,6.3} L7{5.2,6.4}。
- **2 个贯穿能力**(`CROSS=['1.3','1.4']` 全站搜索/语言切换)不属某一步,单列"贯穿带"(热力图末尾 `.stagebar.cross` + 楼层 `#Lx`)。
- **客观重打分**:`RESCORE` 覆盖表(`TP.forEach` 应用)按真实路径同维度重锚、去 NVIDIA 偏向;均分 73.6/78.5 → **74.9/77.6**(gap −4.9→−2.7)。最大真实缺口收敛到 **step3 配环境**(−11);**step2 上手引导**昇腾微反超(算子 hub 5 环节框架 > NVIDIA CUDA 资源堆)。
- ⚠️ **未完成的内容 pass**:触点卡的**散文结论(`c[]`/`rec`/`win`)仍多按旧"NVIDIA 偏向"框架写**,与新分数/新叙事不完全一致(如 1.1 现 76/75 但文案仍说昇腾落后)。下一步需逐卡校订散文 + win 标记。
- **旧 6 阶段口径**(认知导航/产品选型/学习文档/资源获取/开发实践/支持社区)已废弃为"用法分类",仅在 git 历史可查。

## 可视化报告结构(`...-visual.html`,单文件)

`<style>`(token + 组件) → `<body>`(topbar + 楼层容器 + lightbox) → `<script>`(数据 + 渲染)。楼层顺序:封面 → **全站 IA 对照**(`#ia`) → **用户旅程图**(`#journey`:顶部 `#scenTabs` 场景 tab + `JOURNEY_OP`→`#jrnGrid`,六行网格 = 步骤头/触点/行为竖向流程图/情绪【昇腾红 vs NVIDIA绿双曲线】/痛点/机会点;render 参数化于 `JOURNEY.length`,7 列自适应) → **触点热力图**(`#heatmap`,`renderHeat` 按 7 步分组+均分+贯穿带,点行跳触点) → **7 步楼层**(`#floors`,`renderFloors` 按 `STEPS` 分组,每步 `#L{k}` + 贯穿楼层 `#Lx`,卡片走 `tpCardHtml(t)`) → **末尾综述**(5 判断各一层) → **行动建议**表 → **责任归属**楼层。
- **渲染函数化**:`renderJourney/renderHeat/renderFloors` 都是函数,`renderAll()` 一次性调;`setScen(id)` 切场景→重渲三处。`stepOf(id)`/`tpsOfStep(k)`/`stepAvg(k)`/`crossTps()` 为分组/聚合 helper。场景无 `STEP_MAP` 项(如 train)→ 三处各显"建设中"占位。
- **改触点分组**:只改 `STEP_MAP.op` 一行;**改分**:只改 `RESCORE` 一行(热力图/卡/旅程 meta/部门自动跟,旅程 meta 文字需手动对齐)。

### 触点卡结构(图文并茂,关键约定)

每卡 = 头(id + 双边评分药丸) + body 两列 + verdict。每列 = `who 标签 → 截图/mockup → 图下说明(adesc/ndesc)`;**图下紧跟一段"这张图里它怎么做"的文字**,不要图文分离。verdict = **差异分析**(完整句子 bullets,别写电报体) + **「昇腾该怎么做」rec**(独立高亮 callout,右挂「主责·部门」色标)。

### 数据与渲染(全在 `<script>` 内联,模拟+真实混合)

- `STAGES` / `TP`(24 触点:`{id,s,name,a,nv,aimg,atag,adesc,nm|nimg,ntag,ndesc,c:[[lab,txt]…],rec,win?}`)/ `JUDGES`(5 综述 + demo 类型)/ `ACTIONS`(P0–P3 表)。
- **`NV_REAL` 映射**:用户后补的 NVIDIA 真实整页截图 → 触点 id。渲染时 `nvimg=t.nimg||NV_REAL[t.id]`、`nvreal=...||!!NV_REAL[t.id]`;**再补 NVIDIA 真图只需在 `NV_REAL` 加一行**(文件丢进 screenshots/ + 加映射),无真图者自动落回 `nm` 描述的深色 mockup。
- **责任部门**:`DEPT_META`(6 部门:体验设计/资料/官网平台/产品/研发·工具链/社区运营,各带色)+ `DEPT_OF`(触点 id → 主责部门)。rec callout 与「责任归属」楼层都读它。**部门口径与 cann-dashboard 的「内部使用者」近似但不同**:这里多了「官网平台」(承接 登录/下载/URL/搜索),改归属只改 `DEPT_OF` 一行。
- 图表全自绘(纯 CSS + 内联 SVG,**无 ECharts**,离线可开):旅程柱/曲线、热力图、综述 Demo(hero/flow/matrix/path/discover)。
- **`SRC` 来源链接表**(`{id:[昇腾URL, NVIDIA URL]}`):每个触点 who 行的"真实截图"标签已换成**可点击来源链接**(`.srclink`,显示精简 URL),改触点锚点要同步改 `SRC` + 图。
- `heatColor(s)`:<66 红 / <72 金 / <78 蓝 / ≥78 绿(问题优先)。

## 配色约定(品牌色)

- **昇腾 = 华为红 `#C7000B`,英伟达 = NVIDIA 绿 `#76B900`**(品牌色 + 评分语义统一用这两色)。改色时注意它们既是品牌色也是 good/bad 语义色,散落在 `:root` 变量、内联 hex、`heatColor` 字面量、JS gradient 里。
- 整体浅色通透 + 白卡柔阴影圆角(沿袭 cann-dashboard / IMG_3633 皮肤)。部门色另用紫/青/蓝/金/靛/粉,**不要**用红绿以免和品牌色混。

## 取证现状

**全部 24 个触点两侧均为真实截图,0 mockup**。NVIDIA 16 张(home/cuda-download/cuda-toolkit/industries/docs/quickstart/training/api/program/archive/samples/nsight/ngc/build/forum/blog),导航/搜索/语言/产品总览/规格/技术支持/FAQ 这 7 个导航级触点复用对应真页(`NV_REAL` 里映射)。昇腾 9 张主图 + 5 张「按重点裁」区段图(产品矩阵/Atlas规格/内联代码/开发工具/HiDevLab)+ 学习路径裁图。**注:解决方案/博客早期曾误用猜错 URL 的 404 截图,已更正为真实页 `/marketplace/solution`(可筛选方案市场)、`/developer/blog`(分类+热门排行),并据此把 2.4 72→76、6.4 68→72 上调,总均分 73.3→73.6。** 评分散见 `TP`(触点)、`STAGES`(阶段均分)、封面 metric;改分要同步这几处(热力图由 JS 自动重算)。

## 踩过的坑(重要)

- **NVIDIA 站点对无头浏览器强反爬**:`developer.nvidia.com`/`docs`/`forums`/`catalog.ngc`/`build` 等子页,headless Chrome 多半返回空白。NVIDIA 真图靠**人工在真浏览器整页截**(用户拖进 `~/Downloads` 后,因 macOS TCC 我读不了 Downloads,需用户在 Finder 拖进 `screenshots/`,我再按文件名标题对号改名)。
- **昇腾子页也会限流无头**:多次请求后 `hiascend.com` 子页(developer/blog、marketplace/solution 等)headless 返回空白;**绕过**:`--headless=new` + `--virtual-time-budget=14000~16000` + 等待 30~40s(`vh=2x` 更稳),换 IP/等一会儿也行。
- **别拿"猜错 URL 的 404"当证据**:踩过——把 `/blog`、`/zh/solution` 的 404 当短板证据,其实真页在 `/developer/blog`、`/marketplace/solution`。找不到先去 WebFetch 首页/搜索扒真实 href,别用 404 充数。
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
- **每次改完自动收尾(用户偏好,不用再问)**:把新架构/约定/现状/坑同步进本文件 → `git commit`(中文 prefix `feat:`/`fix:`/`style:`/`docs:`)→ `git push origin main`,一气呵成。仓库已建:远程 `github.com/SchihHsin/ascend-vs-nvidia-ux`(main)。纯文案/数值微调可不更本文件,但**仍要 push**。
```
# 远程已配置好,直接 push;若换机重建 git 仓:
git init && git add -A && git commit -m "init: 昇腾 vs 英伟达 官网体验竞品分析"
```
