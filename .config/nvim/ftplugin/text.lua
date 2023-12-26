local set = vim.opt_local


set.wrap = true
set.linebreak = true

local keymap = vim.keymap.set
keymap({"n", "v"}, "<Down>", "gj", {remap = true})
keymap("i", "<Down>", "<C-o>gj", {silent = true, remap = true})

keymap({"n", "v"}, "<Up>", "gk", {silent = true, remap = true})
keymap("i", "<Up>", "<C-o>gk", {silent = true, remap = true})
