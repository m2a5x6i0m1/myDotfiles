return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	build = ":TSUpdate",
	lazy = false,
	priority = 1000,
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start) -- Enable treesitter highlighting and disable regex syntax
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Enable treesitter-based indentation
			end,
		})
		vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })
	end,
	config = function()
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"cpp",
			"css",
			"html",
			"hyprlang",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"nix",
			"python",
			"qmljs",
			"regex",
			"vim",
			"vimdoc",
		})
	end,
}
