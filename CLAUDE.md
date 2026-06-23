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
- **两条场景**(`SCEN`,顶部 `#scenTabs` 切换 `setScen('op'|'train')`):**算子开发** / **训练**,**两条都已建**。切 tab 同时重渲染 旅程/热力图/楼层。
  - **训练场景**:`JOURNEY_TRAIN` + `STEP_MAP.train`,新增 3 个训练专属触点 **T2 训练 hub / T4 框架迁移 / T5 训练跑通·分布式**(其余步骤复用共享触点)。训练故事与算子**不同形**:情绪有**两个谷底**——L3 配环境(更重:CANN+框架+数据) + **L4 框架迁移**(NVIDIA 原生零迁移、昇腾需 torch_npu+MindSpeed)+ L5 分布式首跑门槛。**T2/T4/T5 的 NVIDIA 侧暂为文本 mockup(NeMo/原生框架/NCCL),待补真图**。
- **旧 24 触点全部保留、按 `STEP_MAP[scen]` 映射到 7 步**(深+广两级:步骤=粗、触点卡=细)。映射:L1{1.1,1.2,2.1,2.3,2.4} L2{2.2,3.2,3.3,5.4} L3{4.1,4.2,4.3,4.4} L4{3.1,3.4,5.1} L5{5.3} L6{6.1,6.2,6.3} L7{5.2,6.4}。
- **2 个贯穿能力**(`CROSS=['1.3','1.4']` 全站搜索/语言切换)不属某一步,单列"贯穿带"(热力图末尾 `.stagebar.cross` + 楼层 `#Lx`)。
- **客观重打分**:`RESCORE` 覆盖表(`TP.forEach` 应用)按真实路径同维度重锚、去 NVIDIA 偏向;均分 73.6/78.5 → **74.9/77.6**(gap −4.9→−2.7)。最大真实缺口收敛到 **step3 配环境**(−11);**step2 上手引导**昇腾微反超(算子 hub 5 环节框架 > NVIDIA CUDA 资源堆)。
- ⚠️ **进行中的内容 pass**:触点卡的散文结论(`c[]`/`rec`/`win`)+ 锚点要逐卡校订到"同维度 + 客观"。
  - **已校订**:`1.1 首页第一屏`、`1.2 顶部导航` 重锚到**昇腾开发者中心 `/developer`**(图 `08-ascend-developer.png`、SRC 改 `/developer`)对位 `developer.nvidia.com`——**不再拿品牌页 hiascend.com 比 NVIDIA 开发者页**(这是反复踩的锚点错位,见 memory `dev-portal-anchor-correction`);连带**综述①**从"动作导向 vs 品牌叙事"改成"一句话钩子 vs 卡片菜单(落地都不弱)+ 好落地页埋二级"。1.1 分 78/77。
  - **已校订(续)**:`2.1 产品总览` 把"昇腾品牌站矩阵 vs NVIDIA 开发者站 Platforms&Tools"明确成 **IA 差异本身**(单站 vs 双站)、并把"选型分诊"改成**共同可优化点**(不再单扣昇腾);`1.4 语言` SRC 改 `/developer`;综述 j2/j4/j5 的 plab "阶段X"→"步骤X"。
  - **审计结论**:其余卡(3.3/3.4/5.3/5.4/4.4 等)散文**已是"取舍"框架、昇腾长板有 surface**,不属偏向;`4.2 登录`/`4.3 SDK下载`的低分是**真实谷底**(登录前置+7步),非偏向,保留。`win` 维持 1.3/3.2/6.3(真实昇腾占优),1.1 现 78/77 但文案"落地都不弱"故不标 win。
  - **内容 pass 基本完成**;若用户仍觉某卡偏向,逐卡点名再调。
  - **NVIDIA 真图补齐(用户手动截)**:`06-nvidia-specs`(2.3 H100 规格页)、`07-nvidia-search`(1.3 全站搜索页;**据此把 1.3 从昇腾 win 改为平手 76/76**)、`08-nvidia-support`(6.2 Support 分层页)、`01-nvidia-brand-home`(nvidia.com 官网首页)、训练:`06-nvidia-nemo`/`07-nvidia-frameworks`/`08-nvidia-nccl`(T2/T4/T5 换真图,不再 mockup)。
  - **1.1 拆成两个先后触点**(用户:"先首页再开发者"):**`1.1` 官网首页**(hiascend.com ↔ nvidia.com,官网↔官网,76/74,讲单站vs双站)+ **`1.1b` 开发者门户首屏**(/developer ↔ developer.nvidia.com,开发者↔开发者,78/77)。两者都在 step1,STEP_MAP 两场景都加 `1.1b`。
  - **导航类触点用横条显示**:`.shot.bar`(aspect-auto + height-auto,满宽不裁),触点加 `bar:true`(现 1.2);否则 16:10 cover 会把导航长条裁得只剩中间。导航专图 `08-ascend-dev-nav`/`01-nvidia-nav`。
- **旧 6 阶段口径**(认知导航/产品选型/学习文档/资源获取/开发实践/支持社区)已废弃为"用法分类",仅在 git 历史可查。

## v3 四-tab 改版 + 用户视角触点(主体已落地,箭头待铺)

> **已落地**:① 顶部 4 一级 tab `showTab()`(概览/算子开发/训练/综述结论),内容分 3 面板(`#tab-overview` 封面+IA / `#tab-scenario` 旅程+热力+楼层,算子训练共用+`setScen` 驱动 / `#tab-synth` 综述+建议+责任);② 综述分三组(`JUDGES` 的 `g:'common'|'op'|'train'`,共性4/算子1/训练2,新 demo `demoMigrate`/`demoDist`);③ **每个触点带"用户视角"动线条**(`POV` map → `povOf()` → `.pov` 带:第一人称 say + 动线 chips,按场景变);④ **触点图按场景换图**(`pick()` + `aimg/nimg={op,train}`),导航 1.2 已接入标注图。
> **已完成**:**点击箭头铺满全部 28 触点、两侧都有**。机制:每触点 `aimg/nimg` 指向**烤进箭头的标注图**(`pick()` 按场景取),`bar:true` 让标注图整图显示(不 16:10 cover)。
> - **标注脚本**(`materials/.../screenshots/` 下用 `/tmp/annlib.py`):`annotate(src,out,anns,crop,pad,fsz)` = 裁区域 + **50% 透明圆点 marker** + 箭头 + 底部圆角标签条;`anns` 元素 `(tx,ty,label,color,lx)`,`tx=None` 则纯注记无 marker。**原图绝不改,标注版另存**(命名 `<图>-op/-train.png` 分场景 / `<图>-<id>.png` 通用)。
> - **颜色约定(铁律)**:`OP=#7c5cf0 紫`=算子专属点击 / `TR=#1f9fb8 青`=训练专属 / `NEU=#2f6fed 蓝`=两场景点同一处(蓝顺带表"这步两条线一样")。**箭头必须指到用户真会点的元素**(踩过:训练误指 NVIDIA「Training」,实为「Platforms and Tools」→NeMo)。
> - **分流(`aimg={op,train}`)的触点**:1.1b/1.2/2.1/3.1/3.2/5.1/5.2/6.1;训练专属 T2/T4/T5=青、5.3=紫(仅 op 出现);其余=蓝单图。
> - **昇腾侧箭头精确指元素**(能裁图定坐标);**NVIDIA 侧多为描述式注记**(反爬截不了可交互页,且部分是"页脚/无此页"的发现,如 Developers 在页脚、无集中 FAQ)。
> - **配套「用户视角」动线条**(`POV` map → `.pov` 带:第一人称 say + 点击动线 chips,按场景变):动线讲"路径"、箭头标"在这页点哪",互补。

下面是早期"计划"留档(方向不变):

- **顶部 4 个一级 tab**:**概览 / 算子开发 / 训练 / 综述结论**。
  - 概览 = 封面 + 全站 IA + 两场景总览(均分 / 算子单谷底 vs 训练双谷底 / 怎么读),**无触点二级**。
  - 算子开发 / 训练 = **二级 = 旅程总览 + 7 步**(每步点开是该步触点分析)。
  - 综述结论 = 综述(三部分,见下)+ 行动建议 + 责任归属,**无触点二级**。
- **触点按场景独立分析(核心)**:同一个页面,算子的人 vs 训练的人**点法/找的内容不同 → 分析不同**。不再共享一套散文。每个触点要带:**①用户动线条**(他怎么一步步点,场景配色 chips+箭头)+ **②第一人称一句话**("我是算子开发者,到这页要找 Ascend C…")+ **③每页截图上画点击箭头**。
- **点击箭头标注法(样板已出,待铺开)**:用 **PIL 把箭头+标签烤进图**(像素级、保证指准),不用 HTML 叠加(坐标更可控)。**算子=紫 `#7c5cf0` / 训练=青 `#1f9fb8`**;脚本见 git 历史(annotate():目标点 marker 圆 + 圆角标签框 + 箭头)。命名建议 `<img>-op/-train.png`。**铁律:箭头必须指到用户真会点的元素**——踩过 NVIDIA 训练误把箭头指到「Training」(实为 DLI 课程),正解是「Platforms and Tools」(→NeMo/框架)。样板:导航条 昇腾(算子→文档 / 训练→学习)、NVIDIA(算子→Docs / 训练→Platforms&Tools)。
- **综述分三部分(半成品)**:`JUDGES` 加 `g:'common'|'op'|'train'`(已给 j1/j2/j3 加 common,j5 待加、j4 改 op);**共性**=落地都不弱/配环境闸门/账号语言社区镜像/SEO 可发现性;**算子专属**=上手反转长板(算子 hub 5环节 vs CUDA 资源堆);**训练专属(待新增 2 条)**=框架迁移摩擦、分布式首跑门槛。综述 render 需按 g 分组加组标题(`#synthfloors` 渲染处,未改)。

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

## DJFI 评分内核(2026-06 · 名实相符化,已铺满 28 触点)

> **背景**:此前有过一次会话把分数改成"DJFI 摩擦指数"但**只立了方法论外壳、没接数据**(RESCORE 仍是手填值、封面均分写死、方法论楼层吹"公式可复现"却没有任何实测原料)。本次把**内核真正接上**。

- **引擎**(`<script>` 内,RESCORE 之后):`DJFI_ANCHORS`(16 指标 × best/worst/类型)+ `DJFI_DIM`(5 维度 A效率/B认知/C准入/D可执行/E可发现)+ `djfiNorm()` 归一化 + `djfiSide()` 合成(维度分=指标均值、触点分=维度均值,等权)。
- **实测表 `MVAL`**:`{触点id:{a:{指标:值}, nv:{...}}}`,**值由 CLAUDE.md 取证 + 触点卡描述推定**(非凭空)。**缺测=该维度不适用此触点 → 排除出均值**(不填值)。**28 触点全部已铺**。
- **应用**:`TP.forEach` 里有 `MVAL[id]` 的触点,`t.a/t.nv` 由公式算出、覆盖 RESCORE,并存 `t.djfi={a,nv,m}`。RESCORE 现已被 MVAL 全量覆盖(留作 fallback)。
- **渲染**:① 触点卡底部 `djfiTableHtml(t)` = 可展开「DJFI 实测明细」(逐指标实测值→归一化分→维度分→触点分);② 方法论楼层 `#djfiRules`(锚点总表)+ `#djfiExample`(算例 4.3,**实时计算、不再手写**);③ 封面均分 `#coverAvg` 由 `updateCover()` 动态算(24 主触点等权)。三者在启动时 `renderDjfiRules();renderDjfiExample();updateCover();`。
- **归一化规则(铁律)**:数值 `(worst−实测)/(worst−best)×100`;摩擦布尔(登录/协议)有=0/无=100;能力布尔(代码可跑)有=100/无=0;比例 ×100。**改锚点只改 `DJFI_ANCHORS`、改实测只改 `MVAL`**,卡/算例/封面自动跟。
- **算完的结果(关键)**:封面 24 主均分 **77.2 / 83.5(gap −6.3)**——比旧手填的 −2.7 **更宽**,因为诚实计 friction 后 4.3 暴跌到 **21/87**(登录+协议+无内联可跑命令,C/D 维归零)。**昇腾新占优 5 个**(1.1 首页 / 2.3 规格 / 3.2 快速入门 / 5.2 模型库 / 6.3 FAQ,均已 `win:true`)。1.1b 翻成 NVIDIA 占优(80/92)、散文已据此改写。
- ⚠️ **铺满后散文与计算分可能冲突**:已校订 1.1b(认 NVIDIA)、2.3(认昇腾);其余卡若 `win`/"平手"措辞与算出的分明显矛盾,需逐卡再校。

## 社区承接 tab(2026-06 · 新维度,两侧 6 题全部铺满)

> **第 4 个一级 tab**`社区承接`(`showTab('comm')`,按钮 `data-t="comm"`,橙 `#e8833a`;`else` 分支自动接管显示 `#tab-comm`)。**与算子/训练 tab 同皮**:每条问题 = 一串「模拟真人找答案」步骤卡(昇腾左真图+注解 / NVIDIA 右),**优先官方、找到就停、找不到转二手**;末尾给两侧综合承接分。

- **问题源**:算子开发人机协同时序图的 6 条问题(D 写kernel / M Tiling / X 内存越界 / O 注册集成 / L 精度排查 / 决策 soc版本),见 `community_uptake_questions.md`(自包含口径)。
- **打分=与 DJFI 同构**(实测→归一化→合成,**不是另一套**):每目的地实测 5 指标(②可抓取/③详尽/④版本清晰/⑤数量/⑥可信度,1–5)→ nm=v/5 → **综合=1−(1−OFF)(1−SEC)**(OFF=官方②×③、SEC=二手⑤×⑥)× 版本因子`0.7+0.3·nm④`。官方文档/仓/论坛属官方、不计入二手。二手拆**六平台**(CSDN/博客园/知乎/华为云bbs/segmentfault/云厂商;知乎反爬403)。
- **对比**:每条问题配一条"换栈"的 CUDA 对照问,两侧各走一遍(NVIDIA 侧 docs.nvidia.com/forums/GitHub/StackOverflow)。
- **取证铁律**:绝不编造;真实检索(WebSearch+无头截图);区分实测/推断;受阻记中性「受阻」。**昇腾侧无头可截我自动跑;NVIDIA 侧反爬→给截图清单、用户手动补图**(命名 `comm-<Q>-nv-NN-*.png`,昇腾 `comm-<Q>-asc-NN-*.png`,标注版 `.ann.png`)。
- **6 题昇腾侧已铺满**(真图+注解+承接分):**D 77 / M 78 / X 70 / O 78 / L 77 / 决策 77**。承接分=能否找到可用答案(≠任务难易)。
  - **X 最低 70**:msSanitizer 小众、**二手几乎只返回官方**(SEC 0.24)→ 没社区兜底,全靠官方,SPA 受阻代价最大。
  - **O 78 但任务摩擦最高**:torch_npu OpPlugin 要改源码+重编译(承接高≠上手易)。
  - **决策**:soc_version 靠 `npu-smi info` 易,但版本配套矩阵密集散乱、是高频踩坑。
  - 共性:官方深文档静态可抓+详尽,但①入口 SPA 挡 AI ②版本号严重散乱(④=2,版本因子 0.82 封顶)是全局拖累。
- **NVIDIA 侧已整合**(用户在真浏览器补完 15 张截图,我用 click-annotation skill 加箭头注解、按同口径打分填进右栏):**D 90 / M 96 / X 93 / O 90 / L 85 / 决策 96**。
  - **共性**:NVIDIA 官方文档**全部静态可抓 + 版本清晰**(无 SPA),SO 二手普遍厚 → 6 题承接分全面高于昇腾。
  - **L 差距最小(85,昇腾 77)**:SO「numerical precision mismatch」该检索词命中 0(措辞偏窄·非真空,cuda-gdb 仍覆盖);昇腾 L 二手反而厚(CSDN/华为云有量),拉近差距。
  - **X 差距最大(NVIDIA 93 vs 昇腾 70)**:compute-sanitizer + SO 7 条 vs msSanitizer 几乎无社区——昇腾这题最该改"官方直链可被 AI 抓"。
- ⚠️ **macOS 沙盒 MACL 坑**:在 Documents 下写新文件可能被加 `com.apple.macl` xattr,让 `xattr -c`/Chrome headless `file://` 都拒读;**绕道**:用 Python `open(...,'wb').write(b); os.replace(...)` 直接重写覆盖,新文件无 MACL 即解锁(`open` 命令不行、`/tmp/` 不在沙盒授权目录也访问不到)。
- ⚠️ **坑**:comm 面板默认 `hidden`,静态 `<img loading="lazy">` 在隐藏容器里点开 tab 不加载 → comm tab 的图**不要用 lazy**(已去掉)。

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

## 综合汇报 PPT(`reports/synthesis/index.html`)

由 **report-ppt-skill** 产出的单文件纵向翻页 deck(13 页),把**两个项目合成一份**:本项目(人侧 UX 体验旅程)⊕ `../opknow`(AI 侧「大模型对昇腾内容可获取性」)。主线:**Agent 时代,用户既是人也是 AI**。封面标题=**「业界大模型对昇腾社区内容可获取性分析」**。**只用算子开发场景**(已去训练)。

- **页序**:1 封面 / 2 AI趋势立论(cann#12 切角三卡,2026 数据)/ 3 人机时序图 / 4 两套度量 / 5 关键数字(胶囊)/ 6 人类旅程 / 7 AI可用性热力 / 8 竞品对照 / 9 撞点合一 / 10-11 黑底改进+A–F / 12 甘特 / 13 收尾。
- **铁律:能用源材料的精调原图就别手搓**(踩过坑两次——自画的 SVG/件很毛坯,用户两次打回)。已嵌入的真图(都在 `reports/synthesis/`):`journey-op.png`(本项目 7 步旅程图)/`ai-usability-heat.png`(opknow 17 可用性矩阵)/`touchpoint-heat.png`(本项目触点热力)。复用 skill 精调件:封面 s-cover / 胶囊 stat-grid / cann#12 三卡 .dh / 甘特 .rm / 黑底设计点 s-glow。**仍是手搓**:页4 .duo、页9 .collide(纯文字综述,源材料无对应图)。
- **页3 时序图 = 复用 opknow 20 的 D3 原图,不要截图也不要手搓**:做法=把 `opknow/20_human_ai_journey.html` 整页 `cp` 成 `reports/synthesis/seq-d3.html`,末尾注入一段 `<style>`+`<script>` 把 `.wrap` 里除 `.chartwrap`/`#tip`/`#tipmask` 外的子元素 `display:none`(隐藏标题/导航/Tab/滑块/结论),只露那张活的 D3 图——**hover 详情、交互全保留**;deck 第3页用 `<iframe src="seq-d3.html">` 内嵌。**横屏适配**:原图是竖长条,在 seq-d3.html 的 `renderV()` 里改两个常量——`dyV 54→38`(压行高)、`Wv 920→1180` + `LX` 生命线间距拉宽(`sec/off/ai/hu/tool` = 235/455/675/895/1110),使其接近横屏比例。场景默认 D(算子开发),训练场景 TR 数据仍在但 Tab 已随 `.wrap` 隐藏(只展示算子开发)。**布局=图文左右排**(iframe 占左 flex:1 吃满高度、`.seq-side` 关联说明竖排在右 flex 28%,右面板套 deck 透白玻璃卡 `.card`,内含两条关联说明 + 深墨 `.bridge` 结论块)——别上下排,横屏 slide 上下空间挤。关联说明:**AI↔昇腾/二手=AI 可用性矩阵打分(opknow)**、**人↔昇腾社区=触点体验(ascend-vs-nvidia-ux)**。
- **2026 AI 采用数据**(页2,Web 检索):JetBrains 2026.01 90% / Gartner 2026 Q1 80%企业嵌 AI Agent / 软件生命周期 2026 调研 97%组织。
- **网址带页码**:翻页回写 `#N`,打开 `index.html#N` 直接跳第 N 页(deck JS 已加 `replaceState`+加载读 hash;**同步进了 skill 模板** `deck-template.html`)。
- **截单页验证**:headless 不真滚动内层容器,截全 deck 只得首屏;**可靠法**=python 把 `#deck` 内容替换成只留目标 `<section>` 再 headless 截(`re.findall('<section class="slide.*?</section>'...)`)。
- **另产出 skill**:`~/.claude/skills/click-annotation/`(把「截图上加点击注解」做成通用 skill,`annotate.py` 颜色/裁剪/场景全参数化,50% 透明圆点+箭头+底部标签条,原图绝不改)。

## 协作规则

- **用中文**交流。
- **视觉/设计类改动先提 2–4 个选项**让用户选(可用 AskUserQuestion),不要直接实现。
- **模拟数据先行**:缺真实结构时用模拟数据/标注 mockup 做成完整楼层,后续替换。
- **每次改完自动收尾(用户偏好,不用再问)**:把新架构/约定/现状/坑同步进本文件 → `git commit`(中文 prefix `feat:`/`fix:`/`style:`/`docs:`)→ `git push origin main`,一气呵成。仓库已建:远程 `github.com/SchihHsin/ascend-vs-nvidia-ux`(main)。纯文案/数值微调可不更本文件,但**仍要 push**。
```
# 远程已配置好,直接 push;若换机重建 git 仓:
git init && git add -A && git commit -m "init: 昇腾 vs 英伟达 官网体验竞品分析"
```
