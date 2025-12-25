local keymap = vim.keymap.set
local set = vim.opt_local
vim.cmd.runtime({ "ftplugin/text.lua", bang = true })

local function switch_to_markdown()
	vim.cmd(":set filetype=markdown")
end

local function switch_to_tex()
	vim.cmd(":set filetype=tex")
end

local function switch()
	print(vim.o.filetype)
	if vim.o.filetype == "tex" then
		switch_to_markdown()
	else
		switch_to_tex()
	end
end

local function Build()
	local command = string.format("md_to_pdf %s; echo 'Result in %s.pdf'", vim.fn.expand("%:p"), vim.fn.expand("%:p:r"))
	require("kitty-runner").launch(command)
end

keymap("n", "<leader>ms", switch, { silent = true, remap = true })
keymap("n", "<leader>mp", require("snacks.image").hover, { silent = true, remap = true }) -- show image
keymap("n", "<leader>mt", ":TableModeRealign<CR>", { silent = true, remap = true })
keymap("v", "<Leader>b", "2<Plug>(sandwich-add)**", { silent = true, remap = true })
keymap("n", "<Leader>rr", Build, opts)
keymap("n", "<Leader>rb", Build, opts)

vim.g.table_mode_always_active = true

vim.cmd([[
  function! OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])
