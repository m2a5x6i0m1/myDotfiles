-- Better diagnostic
vim.diagnostic.config({
	virtual_lines = {
		source = true,
		current_line = true,
		underline = true,
	},
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})
