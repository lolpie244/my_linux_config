local set = vim.opt_local
local keymap = vim.keymap.set

set.spell = false
set.buftype = "nofile"
set.cursorline = true
vim.cmd("silent! %s#\\($\\n\\s*\\)\\+\\%$##")
vim.cmd("silent! %s/\\s\\+$//e")
vim.cmd("normal! G$")
