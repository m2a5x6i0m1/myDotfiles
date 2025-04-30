-- Must have
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.wrap = false

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- tabs & indentation
vim.opt.backspace = "indent,eol,start"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- appearance
vim.opt.conceallevel = 0
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

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
