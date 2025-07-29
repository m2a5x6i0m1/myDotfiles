return {
	"https://github.com/neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			root_markers = { ".git" },
		})
		vim.lsp.enable({ "nixd", "bashls", "harper_ls", "lua_ls", "clangd", "rust_analyzer" })
	end,
}
