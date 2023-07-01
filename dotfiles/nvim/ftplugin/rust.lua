local keymap = vim.keymap.set
local opts = { remap = true, silent = true }
vim.g.cmake_state = "Debug";


function Build(silent)
  	if silent then
  		vim.api.nvim_command(":silent ! cargo build")
	else
		vim.api.nvim_command("! cargo build")
	 end
end

function Run()
	Build(true)
	require("kitty-runner").send_to_runner("clear; cargo run")
end


keymap("n", "<Leader>rb", ":wa<CR><cmd>lua Build(false)<CR>", opts)
keymap("n", "<Leader>rr", ":wa<CR><cmd>lua Run()<CR>", opts)
