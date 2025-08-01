if vim.g.neovide then
	-- General
	vim.g.neovide_fullscreen = false
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_padding_top = 2

	vim.o.winblend = 10
	vim.o.pumblend = 10

	-- Font rendering
	vim.g.neovide_text_gamma = 0.8
	vim.g.neovide_text_contrast = 0.1
	vim.g.neovide_underline_stroke_scale = 1.5

	-- Animations
	vim.g.neovide_cursor_vfx_mode = { "torpedo", "ripple" }

	vim.g.neovide_scroll_animation_length = 0.1
	vim.g.neovide_scroll_animation_far_lines = 1

	vim.g.neovide_cursor_smooth_blink = true
	vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait1500-blinkoff1200-blinkon1200"

	-- Keymaps
	vim.keymap.set("v", "<C-S-c>", '"+y') -- Copy
	vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
	vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<C-S-v>", "<C-R>+") -- Paste insert mode
	vim.keymap.set("t", "<C-S-v>", "<C-\\><C-N>+Pi") -- Paste terminal mode
end
