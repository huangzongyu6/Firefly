// 右侧栏配置
// 音乐 + 最新动态 + 一段文字

export interface RightRailConfig {
	// 是否显示音乐播放器
	showMusic: boolean;
	// 是否显示最新动态
	showDynamics: boolean;
	// 动态条数
	dynamicLimit: number;
	// 文字区块（之后可以往 lines 里加句子）
	quote: {
		enabled: boolean;
		title: string;
		lines: string[];
	};
}

export const rightRailConfig: RightRailConfig = {
	showMusic: true,
	showDynamics: true,
	dynamicLimit: 3,
	quote: {
		enabled: true,
		title: "About",
		lines: ["记录一些感想。", "这里以后会放一些我喜欢的句子。"],
	},
};
