return {
	"folke/flash.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		vim.keymap.set({ "n", "x", "o" }, "<leader>/", function()
			require("flash").jump()
		end, { desc = "Flash Jump" }),
	},
}
