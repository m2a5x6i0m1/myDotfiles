return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = {
		"markdown",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("render-markdown").setup({
			completions = { lsp = { enabled = true } },
			render_modes = true,
			callout = {
				quote = {
					raw = "[!QUOTE]",
					rendered = "󱆨 Quote",
					highlight = "RenderMarkdownQuote",
					category = "obsidian",
				},
				cite = {
					raw = "[!CITE]",
					rendered = "󱆨 Cite",
					highlight = "RenderMarkdownQuote",
					category = "obsidian",
				},
			},
			heading = {
				border = true,
				sign = false,
			},
			code = {
				sign = false,
				position = "right",
				border = "thick",
				width = "block",
				left_pad = 2,
				right_pad = 2,
				min_width = 80,
			},
		})
	end,
}
