// 移动端底部导航配置
// 说明：示例图里「文章」和「归档」都指向归档页，这里把第二个换成「相册」，
// 避免两个 tab 跳到同一个地方；想改回直接改 url / name 即可。

export interface MobileTab {
	name: string;
	url: string;
	icon: string;
}

export interface MobileNavConfig {
	tabs: MobileTab[];
	// 「更多」面板里的链接
	more: Array<{ name: string; url: string }>;
}

export const mobileNavConfig: MobileNavConfig = {
	tabs: [
		{ name: "首页", url: "/", icon: "material-symbols:home" },
		{
			name: "文章",
			url: "/archive/",
			icon: "material-symbols:article-outline-rounded",
		},
		{ name: "动态", url: "/dynamic/", icon: "material-symbols:forum-rounded" },
		{
			name: "相册",
			url: "/gallery/",
			icon: "material-symbols:photo-library",
		},
	],
	more: [
		{ name: "分类", url: "/categories/" },
		{ name: "关于我", url: "/about/" },
	],
};
