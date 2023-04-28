local keymap = vim.keymap.set
local opts = { remap = true, silent = true }


function Build()
	os.execute(string.format("dotnet build .", vim.fn.getbcwd))
end

function BuildAndRun()
	require("toggleterm").exec(string.format("clear; time dotnet run %s; echo", vim.fn.getcwd()), nil, nil, nil, nil, false)
end

keymap("n", "<Leader>r", ":wa<CR><cmd>lua BuildAndRun()<CR>", opts)
keymap("n", "<Leader>br", ":wa<CR><cmd>lua Build()<CR>", {remap = true})
-- :echo 'Build finished'<CR>
