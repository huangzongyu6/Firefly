// 左侧竖排导航配置
// 设计目标：极简、单列、图标 + 文字

export interface SideNavItem {
	name: string;
	url: string;
	icon: string;
}

export interface SideNavConfig {
	// 顶部主入口（单独放大显示）
	primary: SideNavItem;
	items: SideNavItem[];
	// 页脚附近的小链接
	secondary: Array<{ name: string; url: string }>;
}

export const sideNavConfig: SideNavConfig = {
	// 顶部主入口：关于我
	primary: {
		name: "关于我",
		url: "/about/",
		icon: "material-symbols:person-rounded",
	},
	// 主菜单（图标来自 astro-icon 的 material-symbols 图标集）
	items: [
		{ name: "首页", url: "/", icon: "material-symbols:home" },
		{ name: "归档", url: "/archive/", icon: "material-symbols:archive" },
		{
			name: "分类",
			url: "/categories/",
			icon: "material-symbols:folder-open-rounded",
		},
		{ name: "动态", url: "/dynamic/", icon: "material-symbols:forum-rounded" },
		{
			name: "相册",
			url: "/gallery/",
			icon: "material-symbols:photo-library",
		},
	],
	// 次级链接（留言已关闭，不再显示）
	secondary: [],
};
