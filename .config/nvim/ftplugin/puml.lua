local keymap = vim.keymap.set
local opts = { remap = true, silent = true }

local function Build()
	local command = string.format("plantuml %s; echo 'Result in %s.png'", vim.fn.expand('%:p'), vim.fn.expand('%:p:r'))
	require("kitty-runner").launch(command)
end

keymap("n", "<Leader>rr", Build, opts)
keymap("n", "<Leader>rb", Build, opts)

