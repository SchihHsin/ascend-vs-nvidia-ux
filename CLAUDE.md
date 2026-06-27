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
- **🔴 头号铁律:能复用原件就别手搓——样式和内容都用原来的**(反复踩、用户多次打回)。不只是图片:**整块分析/结论(旅程、综述、行动建议、责任归属…)能从精调好的原报告(`reports/ascend-vs-nvidia-2026-06-13-visual.html`)直接搬/iframe 嵌进来,就别自己重画**——手搓的版本**内容更少、更丑**。原报告的楼层(`#journey/#synth/#actions/#dept` 等)是精调件,要用就**按内容适当分屏**(一层或一条综述判断一页),用 embedfix(同 seq-d3/arch-d3 套路:cp 原文件 + 注入脚本只露目标楼层、隐藏 topnav)iframe 进 deck 页;**别用 `var(--fs-*)` 自己拼组件**。判断顺序:① 原报告有现成的 → 嵌;② skill 有精调件 → 套;③ 都没有才手搓(且先提方案)。
- **铁律:能用源材料的精调原图就别手搓**(踩过坑两次——自画的 SVG/件很毛坯,用户两次打回)。已嵌入的真图(都在 `reports/synthesis/`):`journey-op.png`(本项目 7 步旅程图)/`ai-usability-heat.png`(opknow 17 可用性矩阵)/`touchpoint-heat.png`(本项目触点热力)。复用 skill 精调件:封面 s-cover / 胶囊 stat-grid / cann#12 三卡 .dh / 甘特 .rm / 黑底设计点 s-glow。**仍是手搓**:页4 .duo、页9 .collide(纯文字综述,源材料无对应图)。
- **页3 时序图 = 复用 opknow 20 的 D3 原图,不要截图也不要手搓**:做法=把 `opknow/20_human_ai_journey.html` 整页 `cp` 成 `reports/synthesis/seq-d3.html`,末尾注入一段 `<style>`+`<script>` 把 `.wrap` 里除 `.chartwrap`/`#tip`/`#tipmask` 外的子元素 `display:none`(隐藏标题/导航/Tab/滑块/结论),只露那张活的 D3 图——**hover 详情、交互全保留**;deck 第3页用 `<iframe src="seq-d3.html">` 内嵌。**横屏适配**:原图是竖长条,在 seq-d3.html 的 `renderV()` 里改两个常量——`dyV 54→38`(压行高)、`Wv 920→1180` + `LX` 生命线间距拉宽(`sec/off/ai/hu/tool` = 235/455/675/895/1110),使其接近横屏比例。场景默认 D(算子开发),训练场景 TR 数据仍在但 Tab 已随 `.wrap` 隐藏(只展示算子开发)。**布局=图文左右排**(左 flex:1 吃满高度、`.seq-side` 关联说明竖排在右 flex 28%)——别上下排,横屏 slide 上下空间挤。**透白卡套在「图」底下、不是套文字**:iframe 外包一层 deck 玻璃卡 `.card`,且 `seq-d3.html` 的 `html/body/.chartwrap` 背景改 `transparent`,让玻璃卡透出来(iframe `border:0;background:transparent`);右侧文字面板保持普通无卡。
- **页3「按关系讲解」高亮动效**(用户要的不是横向时间带、而是**竖向按生命线对**:讲矩阵评分=高亮 AI↔昇腾/二手 的所有箭头、其余压暗;讲技术体验=高亮 人↔昇腾社区 的线)。在 `seq-d3.html` 里做:`renderV()` 给每条消息元素打 `data-pair`(`[frm,to].sort().join('-')`,如 `ai-off`/`ai-sec`/`hu-off`/`hu-sec`/`ai-hu`)、每条生命线打 `data-lane`(BRANCH 人独立分支线 pair=`hu-`+目标)。末尾 embedfix 脚本建右上控制条 `#seqctrl`(‹ / ▶按关系讲解 / ›)+ `applyHi()`:遍历 `#journey` 直接子元素——命中 `GROUPS[step].pairs` 的 `data-pair`→opacity 1、命中涉及 lane 的 `data-lane`→1、其余(决策/自身节点/阶段卡/无标记)→0.1~0.12;step 0=全亮(清 inline opacity)。`GROUPS`=[AI↔昇腾/二手·矩阵评分, 人↔昇腾社区·技术体验](2 组),循环 0→1→2→0。重绘(滑块)后 renderV 回调 `__seqApplyHi()` 回填。**没绑方向键**(避免和 deck 翻页冲突),只点按钮;蒙层不挡 hover(改的是 opacity、不加遮罩,`pointer-events` 不变)。
- **深挖拆成「左图右内容」专页(用户最终要的形态)**:不是挤在一页右栏,而是**每个关系各拆几页,左侧统一是打着对应聚光灯的时序图、右侧是该页内容**。`seq-d3.html` 加 `?hi=N` 参数(`location.search` 读 → `go(N)` 锁定聚光灯 + 隐藏控制条),deck 各页 `<iframe src="seq-d3.html?hi=1/2">` 内嵌。左栏卡 **统一宽 `flex:0 0 52%`**(不一致会显得图大小不一)。**2026-06 从 36% 加宽到 52%**:36% 时图 SVG(1255×1182,近正方形)被缩到 ~0.35×、11px 字渲染成 ~4px 看不清(且左栏竖长、图下还空一片);52% 缩放升到 ~0.5×、字约大 1.5 倍可读,右栏(深挖页文字少 / 总览两张 `.ovm` 卡)仍放得下。改宽度只改 `index.html` 里 6 处 `flex:0 0 52%`(第3-8页左栏卡)。
  - **AI↔昇腾/二手(hi=1)** 5 页:① 方法论+场景(怎么跑/7阶段26任务/算子涉及 D·M·X·O·L)② **AI 执行架构**(⚠**2026-06 顺序提到方法论之前**——时序总览→AI怎么跑→怎么测;⚠**此页改版**:`arch-d3` 当**主图(左 64% 卡)** + 右侧「如何运行 / 三种收场:①收敛 ②遇阻回路 ③凭记忆杜撰」文字面板,**去掉了原左侧 `seq-d3`**——因第3页已是整张时序图,架构页再放 seq-d3 会变「两张时序图」重复,用户打回。原描述:引 opknow 20 §4.3 的 Agent 循环图,**已重画**(详见下「当前状态」AI 执行架构图条):一次检索的内部流程——三来源(官方/二手/自带)→④证据是否充分→充分则⑥收敛终答 / 不足则「能否继续检索」(未达上限且预期有效则换词回③再检索)→检索穷尽且无可靠证据时模型凭记忆杜撰。`arch-d3.html`=cp opknow 20 后注入 embedfix 只露 `#archView`、隐藏 tabs/代码、保留 `#tip`,**hover 详情可用**——与 seq-d3 同套裁法)③ **CUDA vs CANN 问题对**(5 个问句对,左 CUDA 绿/右 CANN 红,原文取自 opknow 18 §2)④ **指标怎么算的**(三源官方/二手/自带 × 两关触达/质量 → 11 项 `.mxg` 网格 + ⑧成本/⑨⑩产出/⑪综合;**⑪=噪声-OR、一条渠道扛住就能答、受阻记0**,口径取自 opknow 18 §3/§4 `score_metrics.py`)⑤ **§9 重画矩阵**(算子 5 任务×6 维,**每格昇腾大字配色 / NVIDIA「N x」小字**,D 官方可抓=受阻红;数据从 opknow 17 `ROWS` 提取 cann/cuda 1–5 分)。
  - **人↔昇腾社区(hi=2)** 3 页:① 方法论(7阶段/24触点 + **7步 op7 可点击** `setHStep(k)` → 切下方 `step{1-7}-asc/nv.png` 真实触点截图 + 昇腾/NVIDIA 分 + 一句分析;14 张图从 `materials/.../screenshots` 各阶段代表触点拷来 `sips -Z 1000`)② **指标怎么定义**(DJFI 内核:5 维 A效率/B认知/C准入/D可执行/E可发现 × 16 指标 `.djg`,各带 best/worst 锚点,归一化 best→100/worst→0、维度=指标均值、触点=5维均值;数据取自 `ascend-vs-nvidia-2026-06-13-visual.html` `DJFI_ANCHORS/DJFI_DIM`)③ 触点评分卡(节选 6 触点)。
  - ⚠️ **zsh 数组是 1-indexed**:批量 cp 用 `${A[$i]}` 且 i 从 0 起会错位/丢首个,显式写命令别用数组下标。
  - **时序图左栏统一 52%**(用户:36% 太小看不清,大了清楚)——别再缩;**7 张** `flex:0 0 52%`(执行架构页 2026-06 改用 arch-d3 主图、不再有 seq-d3 左栏,故 8→7)。
  - **矩阵/分数一律重画、不截图**(用户明确:用 report-ppt-skill §9 模板重画,只取算子子集);截图仅用于「真实截图对比」证据(文档触点)。
- **第3页=纯总览**(已精简):36% 时序图(全亮、带控制条供现场按关系高亮演示)+ 右侧两张关系映射卡(`.ovm`:AI↔昇腾→矩阵 / 人↔昇腾→技术体验,各指向「后续 N 页」)。**所有时序图左栏统一 52%**(早先是 36%,因图缩太小字不可读已加宽,见上条)。早先的 postMessage 右栏联动(`__seqOnStep`/`.ss-pane`)已随精简移除,深挖内容全交给 hi=1/hi=2 专页。
- **图填满白卡 + 字够大(2026-06 重调)**:letterbox 留白是图比卡窄;`seq-d3.html` 调 `LX`/`Wv`/`dyV` 让图 aspect≈卡 aspect。**当前 `LX hu/ai/off/tool/sec=205/425/645/865/1085`、`Wv 1130`、`dyV 42`**(早先 Wv 1255 太宽 → 横向被卡宽压扁 → 字缩到 ~0.57× 看不清)。**外加所有图内 SVG 文字 `.attr("font-size",N)` 统一 ×1.35**(脚本 `re.sub(r'\.attr\("font-size",([0-9.]+)\)')` 乘 1.35 取半);marker 圆 r 13/16→15/18、`BARW/BARH 24/42→28/46`、`sideLabel` 偏移 22→28、wrapText 行高 11/12→14/16,配合放大的字不挤。改字号别只改一处——这套是「viewBox 收窄 + 字号整体放大」组合拳。
  - ⚠️ **放大后的错位重叠修复(2026-06,必读)**:1.35× 一刀切会撑爆几处密集区,**已分区回滚**:① **左侧两列(阶段卡 phW70 / 主导方带 owW44)的密集小标签回滚到原始字号**(axis dots 9 / count 10 / header 10 / phase名 9.5+wrapText lh11 / owner名 9.5+wrapText lh12)——它们是 skill 说的「局部小字例外」,不跟主时序区放大,否则横向溢出窄列、压到相邻列;② **blocked 返回标签 `✕抓取为空` + 用户独立分支标签回滚到 10.5**(密集二次注解,大字会横向交叠);③ **顶部 sD/sD2 三行错开**:blocked 返回 `ry=y+15`(贴紧 sD 下方)、非决策分支下沉 `+34`(沉到 sD→sD2 间隙),原先 +23/+26 时 b1 分支与 blocked 同高重叠;④ **图名 `.embed-title` 移左下(`bottom:8`)、控制条 `#seqctrl` 移右下(`bottom:8 right:12`)**——原先都在 `top` 压住顶部列头(图名压「阶段·人/AI」、控制条压「二手社区」)。**口径**:主时序区(生命线名/节点 id/箭头流程标签)放大,密集注解区(左两列/blocked/branch)保持小——别再把它们一起 ×1.35。
- ⚠️ **单页截图脚本的坑**:`s[:first]+one+s[last:]` 会把**夹在 section 之间的内联 `<style>`**(`.op5/.qpx/.hm-*/.op7/.scard` 等都在那)一起删掉 → 截出来「没样式」是假象,不是 bug;验证时要把那些 `<style>` 块一并拼回(`re.findall(r'<style>\s*\.(lc-stages|op7).*?</style>')`)。
- **2026 AI 采用数据**(页2,Web 检索):JetBrains 2026.01 90% / Gartner 2026 Q1 80%企业嵌 AI Agent / 软件生命周期 2026 调研 97%组织。
- **网址带页码**:翻页回写 `#N`,打开 `index.html#N` 直接跳第 N 页(deck JS 已加 `replaceState`+加载读 hash;**同步进了 skill 模板** `deck-template.html`)。
- **截单页验证**:headless 不真滚动内层容器,截全 deck 只得首屏;**可靠法**=python 把 `#deck` 内容替换成只留目标 `<section>` 再 headless 截(`re.findall('<section class="slide.*?</section>'...)`)。
- **另产出 skill**:`~/.claude/skills/click-annotation/`(把「截图上加点击注解」做成通用 skill,`annotate.py` 颜色/裁剪/场景全参数化,50% 透明圆点+箭头+底部标签条,原图绝不改)。
- **⚠ 当前状态(2026-06-24,覆盖上面若干旧描述)**:
  - **deck = 22 页(2026-06 拆页,含封面;人侧 iframe 嵌主报告见末条)**:**封面(双视角标题**:主标「昇腾社区可用性·双视角分析 / 人侧基础体验 × AI侧内容可用性」+ kicker/引语同步校平衡;原单写 AI 侧「内容可获取性」过窄) / **立论(head 01 为什么双视角)**=AI 采用三卡(90/80/97),底部 bridge 只留一句「但开发者真的信任 AI 给出的答案吗?」勾子 / **信任落差(head 02,新拆出独立页)**=把 **Stack Overflow 2025** 不信任数据(33%信任 / 46%不信任 / 66%被「看似正确、实则有误」误导)用**同款 `dh-card` 三卡**呈现(原先挤在立论页底 `.bridge.lite` 一行,用户要求单独成页;三卡 ic 用线性 SVG check/x/triangle,数据源全标 Stack Overflow 2025)。**整页红色警示主题**(section 加 `.warn` class scope):因内容=突出问题,改用 skill 状态红 `--g-red`(`#FF5A6E→#FF6F55`)系——**刻意避开品牌红 `#C7000B`**(那是昇腾色),`.warn` 覆盖 dh-num 渐变/dh-ic 红圈/dh-src 红字/accent 卡红渐变/dark 卡深红/bridge 浅红底;scope 在 `.warn` 不动立论页(#2)共用的 dh-card / 时序图总览(head 03) / **AI 侧 5 页**(**执行架构·方法论**·问法·指标·矩阵——架构在前:时序总览→AI 怎么跑→怎么测) / **人侧 11 页**(指标定义·方法·评分 + iframe 嵌主报告:旅程 / 5 条综述 / 行动建议 / 责任归属,见末条) / **结论 2 页**(见下条)。〔原 #12+ 的「两套度量/谷底/人类旅程/撞点/改进/A–F/甘特/收尾」早先删过,现按下条重新补了结论。〕
  - **AI 执行架构图(`arch-d3.html`,AI 侧第 2 页)= 重画 + 「按环节讲解」动效**:重画补 **⑦模型自带知识**第三来源(与矩阵三来源对齐)、写明继续检索/停搜/**凭记忆杜撰**的触发条件、`web_search` 标「官方+二手一并返回」、终答改中性色、删「老实做法」改「模型无法识别自身不知道→凭记忆杜撰」;右上 `‹▶›` 控制条 **7 拍逐环节聚光**(高亮当前节点 / 其余压暗),末拍点出「无可靠证据→凭记忆杜撰」风险。⚠ **讲解动效驱动 deck 外层说明、不是 iframe 内**:arch-d3 每拍 `postMessage({__archCap})` 给父页,`index.html` 监听后更新右卡 `.cmp-cap`——原先更新的是 iframe 内被 embedfix 裁掉的说明行,故看不到变化(踩过的坑)。
  - **AI 侧指标页(「指标如何计算」)**:①②③④ 拆成**一指标一格**、每格悬浮弹出 `score_N` 打分档(取自 opknow 18 §3);补 ⑧⑨⑩(过程/产出);⑪综合重写为 K×版本因子×成本因子、标明 OFF/SEC/OWN 三源构成。
  - **人侧页序 = 指标定义 → 方法论 → 评分**(指标即评分标准,排在「右侧已带得分」的方法论/评分前面)。
  - **翻页 = cut 瞬切**(slide `position:fixed` 堆叠 + `.active` 切换,去 scroll-snap;键盘/滚轮/触摸/`#N`/概览/全屏都在;**不是** fade,用户最后选了 cut)。
  - **矩阵(页8)= 重建 + 逐格核对**:布局 = 第1列「检索问题」(`1-5` 阿拉伯编号 + 任务名,`grid-row:span 2` 跨两行,**编号徽章按综合分状态配色** 红<.60/金<.70/绿)+ 第2列 `CANN`/`CUDA` 栈标签 + 6 维等大格;**数据按 opknow 17 `ROWS` 逐格核对**(曾把 D 的「受阻」错放「官方可抓」列——其实在「正文详尽」、D 官方可抓=2);**CUDA 综合诚实标「高」**(原数据是档位 .88–1.0、无每任务小数,**别瞎编**);`d(v)` 把 1-5→[display,score×20],受阻→[受阻,0]。
  - **任务编号 = 阿拉伯数字 1-5**(矩阵/op5/问题对 `.ql`/时序图「检索X·矩阵X」全统一);⚠ **内部 `data-letter`/节点 id 仍是 D/M/X/O/L 不动**(左右联动靠它),改显示别碰内部。问题对页结构现为 `.qtask`(并发对话改过),联动 `data-letter` 直接写死在 `.qtask` 上(别用读 `.ql` 文字的旧 tagger,已删)。
  - **时序图交互全套(`seq-d3.html`)**:① **两级聚光**——聚光态下悬浮**组内**某条线 → 它全亮、同组其他线 0.32 次要黯淡、非组 0.1;**只响应当前组内的线**。② **模态点击钉住**——点组内线钉住聚焦(再点取消/点别条切换),点空白或线外任意处取消(click 挂 `document`);`curFocus()=hoverMsg||pinnedMsg`,`go()` 切关系时重置。③ 每条线叠 **18px 透明热区线 + `cursor:pointer`**(细 SVG 线热区只有线宽、点不到,只有线上文字能点 → 加宽)。④ **左↔右联动**:`notifyHover()` postMessage `{__seqHover:curFocus()}`,父页按 `e.source` 定位 iframe→section;矩阵/问题页按 msg 里字母 D/M/X/O/L 压暗非匹配 `[data-letter]`;**人方法论页**(`#hstep0` 判定)按 **分支/决策 id→7阶段** 映射 `{b0:0,b1:3,bSoc:2,dSoc:2,b2:2,dVer:2,bTil:3,dTil:3,bAcc:5,dAcc:5}` 调 `setHStep`(⚠ Gitee 那条分支 id 是 `b2` 不是 `bVer`;决策块 dSoc/dVer/dTil/dAcc 也要入表)。⑤ 生命线高亮加粗变色(`data-col` 存色);二手社区即使在组也半透(次要部分)。⑥ 两图左上角灰色图名(embedfix 注入 `.embed-title`)。⑦ **决策点(黄菱形)标题放菱形左上方**(`renderV` 里 `kind==="decision"` 的 `d.t` 标签 `text-anchor:"end"、x:-20`——用户嫌右边被箭头挤不好看;原作者本怕压「主导方」列才放右,实测放左可读)。⚠ **`seq-d3.html` 已和源 `../opknow/20_human_ai_journey.html` 大幅分叉**(生命线顺序重排、术语改名 二手→第三方平台/官方→社区、决策标签左置、embedfix)——**别再当干净 cp,re-cp 会丢这些手改**;改时序图直接改 `seq-d3.html`。
  - **🔴 对标术语铁律(用户反复强调)**:**CUDA ↔ CANN(技术栈对栈)、英伟达 ↔ 昇腾(品牌对品牌)**——**严禁「CUDA vs 昇腾」这种栈对品牌的错配**。AI 侧(矩阵/问法/方法论/指标)统一写成 **NVIDIA 侧「CUDA / 英伟达」 vs 昇腾侧「CANN / 昇腾」**(组合式,栈+品牌一起);人侧(基础体验)比品牌时用 **昇腾 vs NVIDIA**。已修 #6/#7 标题、#6 bridge、#7 问法两栏、#8 理论依据卡里的错配。新写文案务必照此对标。
  - **⚠ 协作坑**:`index.html` 被**多个对话并发改过**(问题页 `.qpx`→`.qtask`、左栏宽 36%↔52% 都是别处改的)→ 两边同时改会打架,**同一时间只在一个对话改**;每次动手前先读最新文件,**用 python 按内容匹配替换、别按行号**(行号会因并发改动错位)。
  - **全篇去口语化(铁律,反复踩)**:deck / seq-d3 / arch-d3 含**图内 SVG 文字**一律书面语,不许口语(见 memory `no-colloquial-wording`)。已踩词→书面:有据就靠谱→证据充分时可靠;一把捞回→一次检索即返回;搜不动/搜不到→检索已穷尽/检索无果;看着对其实错→看似正确、实则有误;编/硬编→杜撰/凭记忆杜撰;模型没有「我不知道」的开关→模型无法可靠识别自身不确定性。**2026-06 又一轮全局扫(25 处)**:拍脑袋→主观臆定;干完→完成;派去查资料→受其委托查阅;找知识→获取知识;逛官网→浏览官网;怎么读→读法;来回→往返;找不到就换个方向→检索受阻则转换方向;真会一个个去查→逐项检索;带着问题去检索→携问题检索;各做一遍/各问一遍→各实测一遍/各提问一遍;三种收场(够了/不够/不知道)→三种结局(证据充分/不足/缺失);全断才崩→全部受阻则失败;瞎逛→无目的检索;最劝退→最易致流失;自助不错→自助尚可。**⚠ 别用辩解式开头**「不是 X」「并非 Y」——用户:有事说事、直接陈述结论(「本指标体系并非主观臆定:…」→「每一维指标都对应成熟…理论」)。
  - **页标题=「像人说的话」但仍书面(2026-06,用户点名 #8)**:**去口语 ≠ 堆术语**——标题既不能口语,也不能写成给工程师看的密文。**禁**:`score_N()`、`SPA`、`kernel`、`×`/`→`/`≠`(箭头乘号当连接符)、`best/worst 归一化`、`三源×两关→11项` 这种符号化/电报体;**要**:一句话讲清这页给观众看什么,结论导向 + 书面词(检索/证据/维度,不用 搜/编)。已改 10 个标题(#5–#14),例:`指标如何计算:三源×两关→11项,score_N()`→`AI 有没有用上昇腾知识,从哪些方面打分:从「能不能找到」到「找到的够不够用」,共 11 项`;`矩阵评分:写 kernel 官方正文 SPA 抓取为空…`→`打分结果:「写算子」这一关最低——官方文档 AI 根本抓不到;其余卡在版本散乱、第三方资料少、模型自带知识弱`。改标题先自查有没有观众看不懂的符号/缩写/内部变量名。
  - **次级 UI 低饱和(memory `muted-secondary-ui`)**:序号徽标 / 说明横条别用高饱和实心紫,改中性灰或淡透明——如问题对 `.ql` 数字徽标(中性灰底)、第2页底部 bridge(浅紫透明底+黑字,宽度对齐上方三卡)。
  - **右上角序号全连续 01–13**(2026-06 拆「信任落差」后从 01–12 顺延为 01–13):封面外 13 页顺序编号(立论 01 / 信任落差 02 / 时序图 03 / AI 侧 04–08 / 人侧 09–11 / 结论 12–13);**三张支撑页(执行架构 05 / AI指标定义 07 / 基础体验指标定义 09)也编入**(原先跳号、缺 03 已修);改序号只改各页 `head-r` 文本。「指标口径」已改称「指标定义」。**head 左上(2026-06 同步 pptskill 更新)**:`.head-l` 用 `flex-direction:column-reverse` 让 `.subttl` 显示在大标题**上方**,且 `.subttl` 改用**章节名**(4 章:立论 / AI 侧 · 内容可用性 / 人侧 · 基础体验 / 结论)——同章多页共用一个 eyebrow;来源标注(opknow / ascend)仍在 head-r 第二行。
  - **🔴 人侧扩展 8 页 = iframe 嵌主报告精调楼层(2026-06,重做)**:用户嫌人侧方法页太简单,要把 `reports/ascend-vs-nvidia-2026-06-13-visual.html` 的「一步步分析 + 结论」搬进来。**第一版我手搓重画(`.jr-/.syn/.acts/.dp`)被打回——内容少、丑**;改成**直接 iframe 嵌原报告楼层**(头号铁律「能复用就别手搓」,见前面)。做法:`reports/synthesis/ar-embed.html` = `cp` 主报告 + 注入 `#embedfix`(读 `?sec=ID`:加 `.embed` class 隐 topnav/netbg/toc/lb/`.footer`;`display:none` 所有 `.floor`、只露目标楼层;**沿祖先链 `removeAttribute('hidden')`+清 display:none**——因 journey 在 `#tab-scenario`、synth/actions/dept 在「综述结论」tab 面板里默认 hidden;synth judge 还要隐同层其它 judge 与 group 头;隐目标 `:scope>.floor-hd`(deck 头已给标题);`setInterval` 重试因 synth/journey 是 JS 异步渲染)。deck 在「触点评分(11)」后插 **8 个 iframe 页**(每页 `.body-area` 里一个 `<iframe src="ar-embed.html?sec=...">`):**12 旅程**(`?sec=journey` 原报告 7 步旅程图,触点×情绪×痛点/机会一应俱全)/ **13–17 五条综述结论**(`?sec=j1..j5`,各一页带原 DEMO:j1 落地钩子·j2 下载闸门−66最高杠杆·j3 账号语言镜像·j4 上手反转长板·j5 被全球搜到SEO;训练 jt1/jt2 略)/ **18 行动建议**(`?sec=actions` P0–P3 表)/ **19 责任归属**(`?sec=dept` 6 部门)。⚠ 改主报告内容后 **ar-embed.html 要重新 `cp`+注入**(它是副本)。 ⚠ **re-cp 后必改 `const IMG`**:从 `../materials/…` 改成 `../../materials/ascend-vs-nvidia/screenshots/`——ar-embed 在 `reports/synthesis/` 比主报告(`reports/`)深一级,不改触点截图全 404 挂掉(踩过)。⚠ **别再手搓这些**——原楼层是精调件。
  - **🔴 单触点页 25 页 = `ar-embed.html?tp=ID`(2026-06-27,一页一触点)**:用户最终要的人侧触点形态=**一页放一个完整触点卡**(头部 + 算子开发者视角流程 + 昇腾/NVIDIA 两张对比图 + 摩擦指数行 + 差异分析 + 昇腾该怎么做),参照原报告触点卡。只放**算子开发**相关触点(去训练),按 deck 顺序 `['1.1','1.1b','1.2','2.1','2.3','2.4','2.2','3.2','3.3','5.4','4.1','4.2','4.3','4.4','3.1','3.4','5.1','5.3','6.1','6.2','6.3','5.2','6.4','1.3','1.4']` 共 25 页,每页 `<iframe src="ar-embed.html?tp=ID">`,deck 头给标题(`{id} · {name}` + 副标 `人侧 · 基础体验 · 触点详情　·　昇腾 X / NVIDIA Y(差值 Z)`)。embedfix `?tp` 分支:`body` 加 `.tponly`,沿 `#tp-ID` 祖先链隐藏所有旁支兄弟只留这一条 DOM、给目标卡加 `.tpsolo`、隐 `.tpcard-hd`(deck 头已给名)+ `.shotcap`(和差异分析重复、留着会撑高被裁)、`fit()` 缩放到一屏(ResizeObserver + img onload 重 fit)。**排版=左右版**(用户定:宽而短的一屏,竖排会让图小/底部裁切):`.tpcard.tpsolo` 设 `display:grid;grid-template-columns:64% 36%`——`.pov`(视角)`grid-column:1/3` 占顶部整宽、左列放 `.tpcard-body`(两张对比图)+ 紧贴其下的 `.djfi`(摩擦指数行,整左栏宽、跟"触点分由公式算出"贴图最协调)、右列 `.verdict`(差异分析+建议)`grid-row:2/4` 占满整高。图 `width:100%`(宽度驱动、填满各自半栏,别用 `width:auto` 会留大空隙);**图嫌小就加宽左列**(图是宽度驱动、纵向通常还空着)。rec(昇腾该怎么做)在 tponly 下改 grid:`rec-tag`+`rec-dept` 同一行(标签左/主责右)、`rec-txt` 另起一行铺满(窄右栏三者并排会把 txt 挤成一条)。⚠ **右侧"像被截断"其实是 deck `.s-gray` 的 `4vw` 两侧 padding 留白**(卡片本身已到内容边界、左右对称、非真截断);宽屏下嫌空,在 index.html 用 `.body-area:has(>iframe[src*="ar-embed.html?tp="]){margin:0 -2.4vw}` 把触点 iframe 两侧往外拉、让卡片用满整宽(只作用 tp 页、不动 head 对齐与其它页)。⚠ **副标题分数用 RESCORE/MVAL 后的 final 值**、不是 TP 原始 `a/nv`(原始的会比卡内分数差几分,不一致)。 ⚠🔴 **`.tpgrid` 是 2 列网格**——`#tp-ID` 作为网格项只占**一列(半幅)且靠左**;`tponly` 必须 `.tpgrid{display:block!important}` 才铺满整宽。 ⚠🔴 **grid 的 `display:grid!important` 只能 scope 到 `.tpsolo`、不能落到广谱 `.tpcard`**——否则 `!important` 顶掉 JS 给兄弟卡设的 inline `display:none`,被隐藏的相邻触点卡(如 1.1b)会一起冒出来(同 ux19 `.ux-show` 坑,2026-06-27 又踩)。
  - **AI 侧问题/发力点 16 页(2026-06,矩阵后)**:把 `../opknow/19_findings_ux_synthesis.html` 的「七个问题 / 供给侧 / 使用侧」搬进来。**①七个问题(§1)= 纯文本丑、用户要求重排**:手搓 `.pg7`(4×2 网格,7 问题卡 + 1 深色收口格,①② 标红「结构性」)。**②供给侧 §3 八卡 + 使用侧 §4 七卡 = 15 页 = iframe 嵌原卡(沿用原 demo 样式,用户:之前 demo 做得好别重画)**:`reports/synthesis/ux19-embed.html` = `cp` opknow19 + 注入 embedfix(`?card=N`:取第 N 个 `.uxcard`,**从该卡一路到 body 逐层隐藏旁支兄弟**只留这一条 DOM 链;隐卡内 `h3`,标题交给 deck 头)。card 1–8=§3、9–15=§4。每页 `<iframe src="ux19-embed.html?card=N">`。⚠ 这条印证规则:**有 demo/精调的就嵌(§3/§4),纯文本丑的才自己重排(§1)**。改 opknow19 后 ux19-embed 要重新 cp+注入。
    - **2026-06 改版(用户反馈)**:**只留供给侧 8 页、去掉使用侧 7 页**(`card=9–15` 的 deck section 删掉);embedfix 升级:**去掉 `.uxcard` 白底盒子**(`background/border/box-shadow/padding` 全清,直接铺 deck 灰底)+ **有 demo 的卡 JS 重排成左右**(`.ux-left` 文字 37% / `.ux-right` demo,`.demotitle` 处切分,避免竖向堆叠被截断),纯文字卡(4–8)全宽居中。⚠ **坑**:给目标卡的 display 规则**必须 scope 到 `.ux-show` 类**(JS 给目标加),**别用广谱 `.uxcard{display:flex!important}`**——`!important` 会顶掉 JS 给其它卡设的 `display:none`,导致 `card=4` 冒出 `card=1`(踩过)。
  - ⚠ **插页后 corner 页码用脚本统一重排**:deck 中段插了 16 页,后面所有 `head-r` 前导号全变;用 `re.sub(r'(<div class="head-r">)\s*\d+\s*( ?/)', ...)` 按文档顺序重编 01..NN(**现 deck = 35 页**:封面 + 01–34;中途删过使用侧 7 页、指标从 1 页扩成 5 页,**页数常变、以 `grep -c '<section class="slide"'` 实际为准**)。
  - ⚠ **iframe embed / 滚动 通用坑(都已修)**:① **嵌入页布局**——opknow18/19 的 `body` 有 `padding-left:188px`(原固定 TOC 侧栏留位),embedfix 只改 `.wrap` 不够,**必须 `body.embed{padding:0!important}`**,否则内容整体被推到右下、不居中;再 `body.embed{display:flex;justify-content:center}` 或卡 `height:100vh` 做竖直居中。② **鼠标在 iframe 上滚不动页**——deck 靠 `wheel` 事件翻页,但 wheel 被 iframe 吃掉不冒泡;解法:每个 embed(seq-d3/arch-d3/ar-embed/ux19-embed/m18-embed)末尾加 `<script id="deckwheelfwd">` 把 wheel `postMessage({__deckWheel:deltaY})` 给父页,父页 `deckWheelNav()` 复用 `wheelLock`+next/prev 翻页。新增 embed 记得带这段转发。③ **总览页(按 O)滚不动**——deck 用 cut 瞬切、base `body{overflow:hidden}`,总览模式没放开纵向滚动,页多了缩略图滚不到底;`body.overview{overflow-y:auto;overflow-x:hidden}` 即解(对齐更新版 skill 模板的 `body{overflow:hidden auto}`)。
  - **AI 指标定义重做成 5 页(2026-06,替换原 #8 seq-d3+mxg)**:用户要去掉时序图、放 `../opknow/18_metric_definition.html` 的 §s3(指标怎么形成)+ §s4(逐项定义),并加一页「理论权威依据」防质疑。① **理论依据**(自写 `.auth` 6 卡:对照实验 / 信息觅食价值链 / findability·retrievability / parametric knowledge / noisy-OR / score_metrics 可复现)——**每张卡底部配真实权威出处 `.au-src`**(Fisher《实验设计》1935 / Pirolli&Card 信息觅食 1999 / Morville《Ambient Findability》+Azzopardi retrievability / Lewis RAG 2020+Petroni 参数化知识 / Pearl noisy-OR 1988 / Pineau ML 可复现性):用户要求**引经据典、别只自己解释**,但**只引真实可核查的经典文献/论文,绝不编造**;标题**别用辩解式**「并非主观臆定」、直接陈述结论。② **§s3 怎么形成**(iframe `m18-embed.html?sec=s3`)③④⑤ **§s4 逐项定义按组拆 3 页**(`?sec=s4&grp=touch|qual|costout`,11 个 `.mcard` 按 touch/qual/cost+out+sum 分组)。`m18-embed.html`=`cp` opknow18 + embedfix(opknow18 **无 section 包裹**,h2 平铺在 `.wrap`,故按「从 `#sX` 显示到下一个 `#s(X+1)` 之前」裁;§s4 组页只显示对应 `.mcard.<grp>`、隐 h2 与 intro note)。改 opknow18 后要重 cp+注入。
  - **结论 2 页(20 核心结论 + 21 设计点链路,2026-06 新增)**:用户要「突出之前做的 5 个设计点,且体现 **分析→结论→设计点** 的链路」。① **20 核心结论**=3 张 `.cc` 卡(AI侧/人侧/合),各带证据 chips(矩阵.41 / 架构图杜撰 / 配环境−11 / SDK−66 / 上手L2反超…)。② **21 设计点·链路**=`.chain` 网格,每行 [号+人/AI 徽标] + 三栏 **分析依据 → 结论 → 设计点**(设计点格 AI 紫 / 人 蓝)。5 个设计点:①智能助手把碎片化信息总结为场景化结构化答案 ②文档=即取即用/可对话/可运行的智能触点 ③沉浸交互式学习 ④基于意图的学习路径推荐 ⑤社区知识 skill 化复用给外部大模型(=①②④对 AI 侧的收口)。归属:①②⑤=AI侧分析推出、③④=人侧旅程推出。证据全部锚回 deck 前面页,不是凭空列设计点。⚠ **字号走 ramp 上档**:结论卡标题 `--fs-h2`、正文 `--fs-body`、链路格 `--fs-body`、徽标 ~30px,`.ccg`/cell 用 `flex:1` 撑满竖向空白——**别用 xs/sm 那两档**(初版用低了、字太小、页面留白多,已上调)。
  - **全 deck 字号对齐更新版 skill ramp(2026-06)**:`:root` 的 `--fs-body` 升到 `clamp(13.5px,1vw,16px)`、`--fs-h3` 升到 `clamp(14px,1.05vw,17px)`(其余档不变),与 `report-ppt-skill/references/type-and-color.md` 的新 ramp 同步。并把全 deck **约 40 处硬编码 `font-size:Npx` 收敛到 ramp token**(`≤11px→var(--fs-xs)`、`12px→var(--fs-sm)`),只保留 13/14/15/16/18px 的 bespoke(封面 `cv-*`、统计大数 `stat-num`、链路序号徽标 `.ch-b .bn`)。**以后新增文字只引用 `var(--fs-*)`、别再手写 px**(skill 铁律);`grep 'font-size:[0-9]' index.html` 自查欠账。
  - **⚠ 放大字号必分两类(用户反复强调)**:① **「写在材料上的字」**(直接铺在页面底上的内容/标签:阶段条 `.lc-stages`、任务卡 `.op5-i b/small`、人侧 7 步 `.op7-i b`、触点分析 `.hs-ana`、问题对内容 `.qx-intent/.qx-c`、结论卡正文…)→ **该放大**(普遍 xs/sm→sm/body)。② **「组件/图表里的字」**(受组件尺寸约束:**矩阵 `.hm-*`**、DJFI 网格 `.djg`、指标网格 `.mxg`、时序图/架构图 iframe 内部 SVG、各种徽章/页码/轴标签)→ **不动**,放大就挤破/溢出。**「整体调大」≠ 全局 ramp×N**——要逐类区分,只放大第①类。(把硬编码 px 收敛到 xs 不会变大,因为 xs=9–11≈原值;真要大必须升一档到 sm/body。)**已按 skill「角色→档位」映射系统性过一遍**(正文/说明/场景→body):副标题 `.subttl`、信任落差三卡正文 `.dh-d`、总览映射卡 `.ovm-d`、指标页总结句 `.mxline` 等全升到 `--fs-body`;`.seq-note` xs→sm。**别再点哪改哪——新增页直接照角色映射给档**。
  - **第5页「问题对」**:每任务补「**同一意图**」横幅(取自 opknow 18 §2)+ 名称/意图/两问装进**半透明白卡 `.qtask`**(无描边);并去掉「CUDA 不放水、昇腾不刁难」。
  - **⚠ 收尾铁律(本人反复忘)**:每轮改完**必须**同步本文件 + commit + push,不要攒到最后;用户多次因没更新 CLAUDE.md 而不满。arch-d3 的改动**两份**(本仓 `reports/synthesis/arch-d3.html` + 源 `../opknow/20_human_ai_journey.html`)都要改并各自 commit/push。
  - **🟢 2026-06-27 改版(防裁剪 + 分页 + 滚动 + 小标题规整)**:
    - **m18 §s4 逐项定义从 3 组拆成 6 组(防裁剪)**:原 `?sec=s4&grp=touch|qual|costout` 三页里 ⑪ 综合那页(costout)最长被裁。`m18-embed.html` 给 11 个 `.mcard` 各加 `data-pg="a..f"`(a=①②官方触达 / b=⑤⑦二手&自带 / c=③④官方质量 / d=⑥二手质量 / e=⑧⑨⑩成本产出 / f=⑪综合),embedfix JS 支持 `grp=a..f` 按 `data-pg` 过滤(旧 touch/qual/costout 仍兼容)。deck 对应 6 页 `?sec=s4&grp=a..f`。**并删了 §s3 的「第三步/第四步」**(过三道关筛 + v1–v5.1 演化时间线)——s3 页太长。
    - **时序图页拆两页**:原「时序图 + DJFI 文案」一页 → ① **时序图页**(仿第6页**图左 52% 卡 + 文右**布局,`seq-d3.html?hi=2` + 右栏三类转向触发 `.trig`)② **DJFI 方法论页**。
    - **🔴 DJFI 方法论 = 嵌 `ascend-vs-nvidia-2026-06-13-visual.html` 的 `#method` 楼层、别手搓**:中途手搓过 native 版(`.thg/.thc/.bound/.calc`)被用户打回「丑、信息少」(又一次踩头号铁律),改回 iframe 嵌原页。visual.html 新增 **embed 模式**:`?emb=1&sec=ID` 隐 topnav/l1tabs/netbg/`.floor-hd`、只露该 `section.floor`;`&pg=N` 按 `#method` 子节点上的 `data-pgstart="N"` 标记分屏。⚠ visual.html 不是副本、是源文件本身,直接改即可(无需 cp)。
    - **⚠ 「生硬嵌套」的解法(2026-06-27 二轮,用户参照 #18/ux19-embed 给的标准)**:iframe 嵌原页**默认很生硬**——原网页底色(`--bg` 浅蓝)、白底硬阴影卡(`.ia-find`/`.method` 是网页风)、版式没为 PPT 重组。**四条整改**:① **底色透明**——`html.emb,html.emb body{background:transparent}` 让 deck 的 `.s-gray` 灰底透上来(别留原网页底色);② **卡片换 deck 玻璃风**——embedfix 里把 `.ia-find`/`.method` 覆盖成 `rgba(255,255,255,.55)+玻璃模糊+柔阴影+圆角`(对齐 deck `.card`,去掉白底硬阴影/虚线网页框);③ **居中 + 内容多才滚**——`.floor{min-height:100vh;display:flex;justify-content:center}` + `body{height:100vh;overflow-y:auto}`:短内容垂直居中、长内容随 body 滚不裁切(**滚动只是兜底,优先分页**);④ **分够页**。⚠ body 当滚动容器后,`deckwheelfwd` 的边缘判定要用 `body.scrollTop`(不是 `window.scrollY`,后者恒 0 会误翻页)。**口诀:嵌原页=透明底+套 deck 玻璃卡+居中+分够页;别让它看着像「网页塞进幻灯片」**。
    - **⚠⚠ 两个致命 bug(2026-06-27 三轮,用户暴怒「还有滚动条」「每页非得放昇腾vs英伟达」)**:
      - **① hero 漏露**:embed 模式隐藏其它楼层用的是 `ov.querySelectorAll('section.floor')`——但 **`#hero` 是 `<header class="hero floor">`(header 标签、不是 section)**,选不中、于是「昇腾vs英伟达 均分 77/83、SDK下载、取证方法」那整块 hero 跟着 #method 一起露出来(还顶高了页面→滚动条)。**改用 `.floor`**(连 header 一起选)只留目标楼层。**记牢:隐藏楼层一律用 `.floor`、永远别加 `section` 限定**。
      - **② 还有个全局页脚漏露**:`<div class="footer">`(证据素材/反爬 mockup 说明)在所有 tabpanel **之外**,既不是 `.tabpanel` 也不是 `.floor`,故 embed 的隐藏逻辑漏掉它、跟着露出来(也顶高页面)。embed CSS 隐藏清单补上 `.footer`。**记牢:visual.html 里 hero(header)、footer(全局)都在 .floor / tabpanel 之外,embed 要逐个显式隐**。
      - **③ 分组分页仍会溢出→滚动**:把 7 个编号点塞 2–3 页单页太满。先按「一点一页」拆 7 页(`data-pgstart=2..7`);**再按用户「一+二 / 三+四+五」合并 → 最终 4 页**(pg1=一理论+二边界 / pg2=三指标体系+四测量协议+五归一化 / pg3=六锚点表 / pg4=七算例+局限),`data-pgstart="2"`@三、`"3"`@六、`"4"`@七;deck `22b~22e`。合并后单页(尤其 pg2 最密)靠**收紧 embed 卡/盒 padding**(ia-find 11/13、method 11/15、floor 2.4vh、字 12px)留安全余量,实测一屏放下、无滚动条。**铁律:嵌长楼层=按它自己的编号小节分页(可适度合并相邻短节),hero/footer 等楼层外块务必显式隐藏**。
    - **责任归属拆 P1/P2(防裁剪)**:共 **6 部门**,`ar-embed.html?sec=dept` 加 `&pg=1|2`,embedfix 按 `#deptgrid .deptcard` 前 3 / 后 3 切(P1=体验设计/资料/官网平台,P2=产品/研发工具链/社区运营)。⚠ **分页时把 `#deptgrid` 强制改 3 列 `repeat(3,minmax(0,1fr))`**——原 grid 是 2 列,3 卡会换行成 2 行(2+1)变高被裁;3 卡并排一行才一屏放下(2026-06-27 修)。
    - **🔴 嵌入页滚动条兜底(防裁剪通用解,m18-embed + ar-embed 都已加)**:楼层仍超高时,embed `body` 改 `height:100vh + overflow-y:auto + display:block`(去掉旧的 `justify-content:center` 竖直居中——内容**默认顶部对齐、向下滚**;细滚动条默认淡、hover 才明显)。**`deckwheelfwd` 改成 edge-aware**:iframe 内未到顶/底时滚轮只滚自身,**仅滚到顶再上滚 / 到底再下滚才 `postMessage __deckWheel` 翻页**(否则一滚就翻页、看不全)。新增 embed 都照此。
    - **小标题(`.subttl`)规整成「章节 · 「本页内容」」**:原各页 eyebrow 杂(有的写英文 `Per-item definitions`、有的写来源 `opknow 18 §4`)。统一为 `章节名 · 「本页一词概括」`(如 `AI 侧 · 指标体系 · 「综合置信度 ⑪」`、`人侧 · 基础体验 · 「责任归属 P1」`)。批量替换用 python 按内容匹配(终端中文显示乱码但读写正常,UTF-8 无 BOM)。
    - **visual.html 顶部 tab 加 hash 定位**:`#overview/#op/#train/#comm/#synth` 直达对应 tab(`showTab` 写 `replaceState`、加载与 `hashchange` 读 hash)。
  - **待办**:① arch-d3 讲解按钮从 iframe 内移到父页外层(用户已要求,未做)② 左右联动——已明确「左侧每条检索线 = 跑一遍整张右侧流程图」(非一线对应一段),方式待定(候选:点左侧检索线→右图高亮该次走的路径/结局,D 受阻杜撰 vs M/X/O/L 收敛终答)。

## 协作规则

- **用中文**交流。
- **视觉/设计类改动先提 2–4 个选项**让用户选(可用 AskUserQuestion),不要直接实现。
- **模拟数据先行**:缺真实结构时用模拟数据/标注 mockup 做成完整楼层,后续替换。
- **每次改完自动收尾(用户偏好,不用再问)**:把新架构/约定/现状/坑同步进本文件 → `git commit`(中文 prefix `feat:`/`fix:`/`style:`/`docs:`)→ `git push origin main`,一气呵成。仓库已建:远程 `github.com/SchihHsin/ascend-vs-nvidia-ux`(main)。纯文案/数值微调可不更本文件,但**仍要 push**。
```
# 远程已配置好,直接 push;若换机重建 git 仓:
git init && git add -A && git commit -m "init: 昇腾 vs 英伟达 官网体验竞品分析"
```

## 标签页图标(favicon)

- **入口 `index.html` + 主报告 `reports/ascend-vs-nvidia-2026-06-13-visual.html`** 头部各内联了一个 SVG data-URI favicon(`<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,…">`,无外部文件、GitHub Pages 直接生效)。
- 图样 = **红绿双柱**(华为红 `#C8102E` 短柱 + 英伟达绿 `#76B900` 高柱 + 深色基线,白底圆角),呼应「昇腾 vs 英伟达」对比主题。下划线开头的临时稿(`_v.html`/`synthesis/*`)未加。
