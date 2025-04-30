return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		vim.keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion", noremap = true })
		vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line", noremap = true })
		vim.keymap.set("n", "S", substitute.eol, { desc = "Substitute to the eol", noremap = true })
		vim.keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode", noremap = true })
	end,
}
