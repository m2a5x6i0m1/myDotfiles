-- Load everything under ./lua/core/
local dir = vim.fn.stdpath("config") .. "/lua/core"
for name in vim.fs.dir(dir) do
	if name:match("%.lua$") then
		local path = dir .. "/" .. name
		local chunk, err = loadfile(path)
		if not chunk then
			error(("error loading %s: %s"):format(path, err))
		end
		chunk()
	end
end

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Fire Lazy.nvim up
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		size = { width = 0.85, height = 0.85 },
		backdrop = 100,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
