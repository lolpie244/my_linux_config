local keymap = vim.keymap.set
local opts = { remap = true, silent = true }


function Build()
	os.execute(string.format("dotnet build .", vim.fn.getbcwd))
end

function BuildAndRun()
	local command = string.format("clear; time dotnet run %s; echo", vim.fn.getcwd())
	require("kitty-runner").send_to_runner(command)
end

keymap("n", "<Leader>rr", ":wa<CR><cmd>lua BuildAndRun()<CR>", opts)
keymap("n", "<Leader>rb", ":wa<CR><cmd>lua Build()<CR>", {remap = true})
