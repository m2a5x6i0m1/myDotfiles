return {
	"hedyhli/outline.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_items = { show_symbol_details = false },
		symbol_folding = { autofold_depth = 2 },
		outline_window = {
			auto_close = true,
			auto_jump = true,
			center_on_jump = true,
			hide_cursor = true,
		},
	},
}
