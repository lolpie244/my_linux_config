local keymap = vim.keymap.set
local opts = { remap = true, silent = true }
vim.g.cmake_state = "Debug";


function Build(silent)
	local state = vim.g.cmake_state
  	if silent then
  		vim.api.nvim_command(":silent ! cargo build")
	else
		vim.api.nvim_command("! cargo build")
	 end
end

function Run()
	Build(true)
	require('toggleterm').exec("clear; cargo run", nil, nil, nil, nil, false)
end


keymap("n", "<Leader>br", ":wa<CR><cmd>lua Build(false)<CR>", opts)
keymap("n", "<Leader>r", ":wa<CR><cmd>lua Run()<CR>", opts)
-- keymap("n", "<Leader>bs", ":wa<CR><cmd>lua SwitchState()<CR>", opts)
