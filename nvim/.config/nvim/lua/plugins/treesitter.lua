return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })

		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			textobjects = { enable = false },

			auto_install = true,
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"html",
				"hyprlang",
				"json",
				"jsonc",
				"lua",
				"markdown",
				"markdown_inline",
				"nix",
				"python",
				"regex",
				"vim",
				"vimdoc",
				"qmljs",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<A-space>",
					node_incremental = "<A-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		require("treesitter-context").setup()
	end,
}
