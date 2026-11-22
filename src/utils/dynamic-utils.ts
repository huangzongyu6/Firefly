import type { CollectionEntry } from "astro:content";

export const sortDynamics = (
	entries: CollectionEntry<"dynamic">[],
): CollectionEntry<"dynamic">[] =>
	entries.sort(
		(a, b) => b.data.published.getTime() - a.data.published.getTime(),
	);

export const dynamicSlug = (id: string): string =>
	id.replace(/\.(md|mdx)$/i, "");

export const dynamicAnchor = (id: string): string =>
	`dynamic-${id.replace(/[^a-zA-Z0-9_-]/g, "-")}`;

export const dynamicPlainText = (entry: CollectionEntry<"dynamic">): string =>
	(entry.body || "")
		.replace(/!\[[^\]]*\]\([^)]+\)/g, " ")
		.replace(/\[([^\]]+)\]\([^)]+\)/g, "$1")
		.replace(/<[^>]+>/g, " ")
		.replace(/[#>*_`~[\]()-]/g, " ")
		.replace(/\s+/g, " ")
		.trim();

// 保留换行的纯文本版本：用于侧栏/右栏这类需要按原样显示多行的场景
export const dynamicMultilineText = (
	entry: CollectionEntry<"dynamic">,
): string =>
	(entry.body || "")
		.replace(/!\[[^\]]*\]\([^)]+\)/g, "")
		.replace(/\[([^\]]+)\]\([^)]+\)/g, "$1")
		.replace(/<[^>]+>/g, "")
		.replace(/[#>*_`~]/g, "")
		.replace(/[ \t]+/g, " ")
		.replace(/\n{3,}/g, "\n\n")
		.split("\n")
		.map((line) => line.trim())
		.join("\n")
		.trim();

export const dynamicSearchText = (entry: CollectionEntry<"dynamic">): string =>
	dynamicPlainText(entry).toLocaleLowerCase();
