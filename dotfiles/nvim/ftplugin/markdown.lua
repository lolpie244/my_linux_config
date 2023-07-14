vim.cmd.runtime({"ftplugin/text.lua",  bang = true })

local keymap = vim.keymap.set

keymap("n", "<leader>r", ':lua require("nabla").popup()<CR>', {silent = true, remap = true})
keymap("n", "<leader>tr", ':TableModeRealign<CR>', {silent = true, remap = true})

vim.g.table_mode_always_active = true

vim.cmd(
[[
  function! OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview']]
)
