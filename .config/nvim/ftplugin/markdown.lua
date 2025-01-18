local keymap = vim.keymap.set
local set = vim.opt_local
local current_nabla_virtual = false

vim.cmd.runtime({"ftplugin/text.lua",  bang = true })

local function update_nabla_virtual()
	if current_nabla_virtual == true then
		require("nabla").enable_virt({ align_center = true, autogen = true })
	else
		require("nabla").disable_virt()
	end
end

local function switch_virtual_preview()
	current_nabla_virtual = not current_nabla_virtual
	update_nabla_virtual()
end

local function switch_to_markdown()
	vim.cmd(":set filetype=markdown")
	update_nabla_virtual();
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


keymap("n", "<leader>ms", switch, { silent = true, remap = true })
keymap("n", "<leader>mv", switch_virtual_preview, { silent = true, remap = true })
keymap("n", "<leader>mp", require("nabla").popup, { silent = true, remap = true })
keymap("n", "<leader>mt", ':TableModeRealign<CR>', { silent = true, remap = true })
keymap("v", "<Leader>b", "2<Plug>(sandwich-add)**", {silent = true, remap = true})

vim.g.table_mode_always_active = true

vim.cmd(
	[[
  function! OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])
