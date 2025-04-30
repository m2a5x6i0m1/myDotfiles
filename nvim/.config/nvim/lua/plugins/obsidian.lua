return {
	"obsidian-nvim/obsidian.nvim",
	enabled = false,
	version = "*", -- Recommended, use latest release instead of latest commit
	event = "VeryLazy",
	config = function()
		require("obsidian").setup({
			completion = {
				blink = true,
				min_chars = 2,
				score_offset = 100,
			},

			workspaces = {
				{
					name = "personal",
					path = "~/vault",
				},
			},

			checkbox = {
				order = { " ", "x" },
			},

			footer = {
				enabled = false,
				format = "{{backlinks}} backlinks  {{words}} words",
			},

			-- daily_notes = {
			-- 	folder = "Daily",
			-- 	template = "daily",
			-- 	default_tags = {},
			-- },

			-- templates = {
			-- 	folder = "Templates",
			-- },

			-- new_notes_location = "notes_subdir",
			-- notes_subdir = "Resources",
			--
			picker = {
				name = "snacks.pick",
			},

			backlinks = {
				parse_headers = false,
			},

			ui = {
				enable = false,
			},

			legacy_commands = false,

			preferred_link_style = "wiki",

			-- TODO: adapt frontmatter function to new obsidian-nvim api
			frontmatter = {
				enabled = true,
				func = function(note)
					local out = { tags = note.tags, date = os.date("%Y-%m-%d") }
					if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
						for k, v in pairs(note.metadata) do
							out[k] = v
						end
					end
					return out
				end,
			},

			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid filename.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			-- Remove keymap that conflicts with mini.bracketed
			vim.api.nvim_create_autocmd("User", {
				pattern = "ObsidianNoteEnter",
				callback = function(ev)
					vim.keymap.del("n", "[o", { buffer = ev.buf })
					vim.keymap.del("n", "]o", { buffer = ev.buf })
				end,
			}),
		})

		-- My personal preference
		vim.keymap.set("n", "<leader>nn", "<cmd>Obsidian new<cr>", { desc = "New" })
		vim.keymap.set("n", "<leader>nd", "<cmd>Obsidian today<cr>", { desc = "Daily note" })
		vim.keymap.set("n", "<leader>nN", "<cmd>Obsidian new_from_template<cr>", { desc = "New from template" })

		vim.keymap.set("n", "<leader>nT", "<cmd>Obsidian template<cr>", { desc = "Insert template" })
		vim.keymap.set("n", "<leader>nO", "<cmd>Obsidian open<cr>", { desc = "Open note with App" })
		vim.keymap.set("v", "<leader>ne", ":Obsidian extract_note", { desc = "Extract to new note" })

		vim.keymap.set("n", "<leader>nb", "<cmd>Obsidian backlinks<cr>", { desc = "Backlinks" })
		vim.keymap.set("n", "<leader>nl", "<cmd>Obsidian links<cr>", { desc = "Outgoing links" })
		vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian tags<cr>", { desc = "Tags" })

		vim.keymap.set("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", { desc = "Find note" })
		vim.keymap.set("n", "<leader>ns", "<cmd>Obsidian search<cr>", { desc = "Search through notes" })
		vim.keymap.set("n", "<leader>nr", "<cmd>Obsidian rename<cr>", { desc = "Rename note" })
	end,
}
