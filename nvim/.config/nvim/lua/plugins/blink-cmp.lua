return {
	"saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = {
			preset = "none",
			["<M-j>"] = { "select_next", "fallback" },
			["<M-k>"] = { "select_prev", "fallback" },
			["<M-]>"] = { "snippet_forward", "fallback" },
			["<M-[>"] = { "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<M-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		completion = {
			list = {
				selection = { preselect = false, auto_insert = false },
			},
			accept = {
				auto_brackets = { enabled = true },
			},
			menu = {
				scrollbar = false,
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				window = { max_height = 8, border = "rounded" },
			},
			ghost_text = {
				enabled = true,
			},
		},
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
		appearance = {
			nerd_font_variant = "normal",
		},
		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				list = { selection = { preselect = false, auto_insert = false } },
				menu = { auto_show = true },
			},
		},
	},
}
