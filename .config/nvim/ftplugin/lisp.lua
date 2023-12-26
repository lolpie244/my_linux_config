local keymap = vim.keymap.set
local opts = { remap = true, silent = true }

function Run()
	local command = string.format("sbcl --script %s", vim.fn.expand('%:p'))
	require("kitty-runner").send_to_runner(command)
end

keymap("n", "<Leader>rr", ":wa<CR><cmd>lua Run()<CR>", opts)
