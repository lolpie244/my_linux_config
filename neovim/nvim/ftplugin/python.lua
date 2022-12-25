local keymap = vim.keymap.set
local opts = { remap = true, silent = true }


local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    return vim.fn.getreg('v')
end

function RunSelected()
	local filename = string.format("%s/.run_selected", vim.fn.getcwd())
	local file = io.open(filename, 'w')
	file:write(get_visual_selection())
	file:close()

	local command = string.format("clear; python %s", filename)
	require('toggleterm').exec(command, nil, nil, nil, nil, false)
end

function Run()
	local command = string.format("clear; python %s", vim.fn.expand('%:p'))
	require('toggleterm').exec(command, nil, nil, nil, nil, false)
end

keymap("v", "<Leader>r", "<cmd>lua RunSelected()<CR>", opts)
keymap("n", "<Leader>r", "<cmd>lua Run()<CR>", opts)

