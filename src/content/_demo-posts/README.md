# 模板示例文章（已隐藏，未删除）

这里存放 Firefly 模板自带的示例文章。它们被移出了 `src/content/posts/`，
所以不会被 Astro 的内容集合加载，站点上看不到。

## 为什么放在这里

- **保留原文**：以后想参考 markdown 语法、mermaid、katex、plantuml 等写法时还能翻。
- **随时可恢复**：把文件移回 `../posts/` 就会重新出现在站点上。
- **不参与构建**：`src/content/posts` 之外的文件不会被内容集合扫描。

## 目录说明

| 条目 | 内容 |
| --- | --- |
| `guide/` | 「Firefly 简单使用指南」示例文章（含封面图） |
| `images/` | 示例文章用到的封面图，文章内以 `./images/xxx.avif` 相对引用 |
| `*.md` / `*.mdx` | 各类语法示例：代码块、数学公式、mermaid、plantuml、加密文章、视频等 |

## 恢复某一篇

```powershell
git mv src/content/_demo-posts/markdown-mermaid.md src/content/posts/
```

图片目录 `images/` 是整个示例文章组共用的，单篇恢复时也要一并移回，
否则封面图会 404：

```powershell
git mv src/content/_demo-posts/images src/content/posts/
```
