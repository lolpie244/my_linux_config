local keymap = vim.keymap.set
local opts = { remap = true, silent = true }

function Run()
	require("kitty-runner").send_to_runner("go run .")
end


keymap("n", "<Leader>rr", ":wa<CR><cmd>lua Run()<CR>", opts)
