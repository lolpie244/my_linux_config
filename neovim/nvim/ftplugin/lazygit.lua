local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- open commit
keymap("t", "O", [[<C-O><C-\><C-n>:execute ':DiffviewOpen' @+ . '^!'<CR>]])
-- compare with current
keymap("t", "C", [[<C-O><C-\><C-n>:execute ':DiffviewOpen' @+<CR>]])
