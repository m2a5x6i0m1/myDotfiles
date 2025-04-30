-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 250, visual = true })
	end,
})

-- Disable continuing comment on newline TODO: Make it behave like checkboxes in bullets.nvim
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- TODO: create autocmd for showing diagnostics in virtual lines by pressing button
-- and keeping them hidden otherwise

-- Syntax highlighting for .env files
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

-- Resize splits when terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- -- Show cursorline only in active window enable
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
-- 	group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
-- 	callback = function()
-- 		vim.opt_local.cursorline = true
-- 	end,
-- })
--
-- -- Show cursorline only in active window disable
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
-- 	group = "active_cursorline",
-- 	callback = function()
-- 		vim.opt_local.cursorline = false
-- 	end,
-- })

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = false }

		opts.desc = "Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "See available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>da", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Restart LSP"
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

		-- opts.desc = "Show LSP references"
		-- vim.keymap.set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<CR>", opts) -- The best
		--
		-- opts.desc = "Go to declaration"
		-- vim.keymap.set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<CR>", opts)
		--
		-- opts.desc = "Show LSP definitions"
		-- vim.keymap.set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<CR>", opts)
		--
		-- opts.desc = "Show LSP implementations"
		-- vim.keymap.set("n", "gi", "<cmd>lua Snacks.picker.lsp_implementations()<CR>", opts)
		--
		-- opts.desc = "Show LSP type definitions"
		-- vim.keymap.set("n", "gy", "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>", opts)
	end,
})
