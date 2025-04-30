return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			local file_details = false

			require("oil").setup({

				default_file_explorer = true,
				watch_for_changes = true,

				use_default_keymaps = false,
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["gp"] = "actions.preview",
					["gl"] = "actions.refresh",
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },

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

				columns = { "icon" },
				win_options = { signcolumn = "yes" },
				view_options = { show_hidden = true },
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
