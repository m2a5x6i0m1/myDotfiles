return {
	"abecodes/tabout.nvim",
	event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>",
			backwards_tabkey = "<M-Tab>",
			act_as_tab = true,
			enable_backwards = true,
			completion = true, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = false,
		})
	end,
}
