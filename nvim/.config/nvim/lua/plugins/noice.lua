return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({

			lsp = {
				progress = { enabled = true },
				message = { enabled = true },
				hover = { enabled = false },
				signature = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},

			messages = { enabled = true },
			popupmenu = { enabled = false },
			notify = { enabled = false },
		})
	end,
}
