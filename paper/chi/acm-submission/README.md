# CHI 2027 匿名投稿模板工程

本目录以 CHI 2027 指定的 ACM Primary Article Template 为源格式。初审 PDF 使用单栏匿名格式：

```tex
\documentclass[manuscript,review,anonymous]{acmart}
```

正式投稿必须使用英文。`main.tex` 是可编译的匿名英文工作稿；`main-cn.tex` 是同一结构的中文审阅排版稿，供内容确定前讨论使用。中文内容讨论稿仍在上级目录的 `01-manuscript-cn-v0.1.md`。

## 使用方式

1. 将本目录整体上传到 Overleaf；
2. 英文稿选择 LuaLaTeX 或 pdfLaTeX 编译 `main.tex`；中文稿选择 XeLaTeX 或 LuaLaTeX 编译 `main-cn.tex`；
3. 在真实用户研究完成后，替换 `\todo{}` 标记与当前的研究状态说明；
4. 初审保持 `manuscript,review,anonymous`，不要提前切为双栏 `sigconf`；
5. 接受后才按 CHI/TAPS 指引切换至最终制作格式。

本工程不捆绑 `acmart.cls`：Overleaf 和 ACM TAPS 均提供 CHI 指定的 ACM Primary Article Template；这样可避免将过期或私自修改的类文件带入投稿包。

## 研究边界

当前稿件是研究设计与理论框架初稿。Study 0 为形成性知识生态审计；Study 1/2 的约 20 名开发者研究尚未实施，不能将 `main.tex` 中的计划性表述改写为已经得到的经验发现。
