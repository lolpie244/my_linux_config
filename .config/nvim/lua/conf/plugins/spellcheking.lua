local set = vim.opt

set.spell = true
set.spelllang = "uk,en"


local ignore_files = {"terminal", "toggleterm"}

local disable_spellcheck = function()
		vim.schedule(function()
			vim.cmd("set nospell")
		end)
	end

vim.api.nvim_create_autocmd({"BufAdd"}, {
	pattern = "/tmp*",
	callback = disable_spellcheck
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = ignore_files,
	callback = disable_spellcheck
})
