local keymap = vim.keymap.set
local opts = { remap = true, silent = true }

function Run()
	local command = string.format("swipl -s %s", vim.fn.expand('%:p'))
	require("kitty-runner").send_to_runner(command)
end

local function get_visual_selection()
	vim.cmd('noau normal! "vy"')
	return vim.fn.getreg('v')
end

local function visual_send()
	require("kitty-runner").send_to_runner(get_visual_selection() .. "\\x0d")
end

local function exit()
	require("kitty-runner").send_to_runner("halt.")
end

keymap("n", "<Leader>rr", ":wa<CR><cmd>lua Run()<CR>", opts)
keymap("n", "<Leader>re", exit, opts)
keymap("v", "<Leader>rs", visual_send, opts)


vim.api.nvim_create_autocmd("BufRead", { pattern = ".pro", callback = function ()
vim.cmd("set omnifunc=syntaxcomplete#Complete")
end })
