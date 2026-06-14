# 截图取证记录

> 现状(2026-06-14):**全部 24 个触点两侧均已用真实截图取证,无 mockup、无遗留失败项。** 本文件保留取证过程中的方法与坑,供复用。

## NVIDIA — 无头浏览器强反爬,改人工整页截
`developer.nvidia.com` / `docs.nvidia.com` / `forums.developer.nvidia.com` / `catalog.ngc.nvidia.com` / `build.nvidia.com` 等子页,headless Chrome(含 `--headless=new` + 真实 UA + 关 AutomationControlled)多半返回空白。**解法**:用户在真实浏览器整页截图后,在 Finder 拖进 `screenshots/`(macOS TCC 会挡住程序读 `~/Downloads`),再按文件名标题对号改名。已覆盖 16 张:home / cuda-download / cuda-toolkit / industries / docs / quickstart / training / api / program / archive / samples / nsight / ngc / build / forum / blog。

## 昇腾 — 多次请求后子页也会限流无头
`hiascend.com` 子页(developer/blog、marketplace/solution 等)在多次 headless 请求后返回空白。**绕过**:`--headless=new` + `--virtual-time-budget=14000~16000` + 等待 30~40s(`--force-device-scale-factor=2` 更稳)。等一会儿 / 换网络也能恢复。

## 教训 — 别拿"猜错 URL 的 404"当证据
解决方案 / 博客早期误用了 `/zh/solution`、`/blog` 的 404 截图当短板证据——错误。真页在 `/marketplace/solution`(可筛选方案市场)、`/developer/blog`(分类 + 官方文章 + 热门排行)。找不到先 WebFetch 首页/搜索扒真实 href,不要用 404 充数。
