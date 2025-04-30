return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		render_modes = true,
		completions = {
			lsp = { enabled = true },
		},
		heading = {
			border = true,
			position = "inline",
		},
		code = {
			border = "thin",
		},
		sign = {
			enabled = false,
		},
	},
}
