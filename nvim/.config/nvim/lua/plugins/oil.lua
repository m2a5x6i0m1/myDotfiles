return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			local file_details = false

			require("oil").setup({

				win_options = {
					signcolumn = "yes",
				},

				view_options = {
					show_hidden = true,
				},

				columns = {
					"icon",
				},

				keymaps = {
					["<Esc><Esc>"] = { "actions.close", mode = "n" },
					["gd"] = {
						desc = "Toggle file detail view",
						callback = function()
							file_details = not file_details
							if file_details then
								require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
							else
								require("oil").set_columns({ "icon" })
							end
						end,
					},
				},

				default_file_explorer = true,

				watch_for_changes = true,
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},

	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = function()
			require("oil-lsp-diagnostics").setup({
				diagnostic_colors = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
				diagnostic_symbols = {
					error = "",
					warn = "",
					info = "",
					hint = "󰌶",
				},
			})
		end,
	},
}
