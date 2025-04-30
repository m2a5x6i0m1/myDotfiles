return {
	"obsidian-nvim/obsidian.nvim",
	event = "VeryLazy",
	config = function()
		require("obsidian").setup({
			frontmatter = {
				enabled = false, -- TODO: Fix it
			},

			picker = {
				name = "snacks.picker",
			},

			backlinks = {
				parse_headers = false,
			},

			checkbox = {
				create_new = false,
				order = { " ", "x" },
			},

			workspaces = {
				{
					name = "personal",
					path = "~/vault",
				},
			},

			legacy_commands = false,
			daily_notes = { enabled = false },
			footer = { enabled = false },
			ui = { enable = false },
		})

		-- Remove keymap that conflicts with mini.bracketed
		vim.api.nvim_create_autocmd("User", {
			pattern = "ObsidianNoteEnter",
			callback = function(ev)
				vim.keymap.del("n", "[o", { buffer = ev.buf })
				vim.keymap.del("n", "]o", { buffer = ev.buf })
			end,
		})

		-- My personal preference
		vim.keymap.set("n", "<leader>nn", "<cmd>Obsidian new<cr>", { desc = "New" })
		vim.keymap.set("n", "<leader>nN", "<cmd>Obsidian new_from_template<cr>", { desc = "New from template" })
		vim.keymap.set("n", "<leader>nb", "<cmd>Obsidian backlinks<cr>", { desc = "Backlinks" })
		vim.keymap.set("n", "<leader>nl", "<cmd>Obsidian links<cr>", { desc = "Outgoing links" })
		vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian tags<cr>", { desc = "Tags" })
		vim.keymap.set("n", "<leader>ng", "<cmd>Obsidian search<cr>", { desc = "Grep notes" })
		vim.keymap.set("n", "<leader>nr", "<cmd>Obsidian rename<cr>", { desc = "Rename note" })

    -- stylua: ignore
		vim.keymap.set("n", "<leader>nf", function()Snacks.picker.files({ cwd = "~/vault" })end, { desc = "Find" })
	end,
}
