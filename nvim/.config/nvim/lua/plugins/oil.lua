return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			win_options = { signcolumn = "yes" },
			view_options = { show_hidden = true },
			default_file_explorer = true,
			watch_for_changes = true,
			columns = {
				"icon",
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
