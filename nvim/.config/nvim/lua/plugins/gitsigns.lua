return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "in git Hunk")

			map("n", "<leader>gh", gs.preview_hunk_inline, "Preview hunk")
			map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle line blame")
		end,
		current_line_blame_opts = { delay = 0 },
	},
}
