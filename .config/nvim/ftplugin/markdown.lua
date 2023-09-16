local keymap = vim.keymap.set
local current_nabla_virtual = false
local switch_filetype = false


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
	if not switch_filetype then
		return
	end
	vim.cmd(":set filetype=markdown")
	update_nabla_virtual();
end

local function switch_to_tex()
	if not switch_filetype then
		return
	end
	vim.cmd(":set filetype=tex")
end


keymap("n", "<leader>ms", function () switch_filetype = not switch_filetype end, { silent = true, remap = true })
keymap("n", "<leader>mv", switch_virtual_preview, { silent = true, remap = true })
keymap("n", "<leader>mp", require("nabla").popup, { silent = true, remap = true })
keymap("n", "<leader>mt", ':TableModeRealign<CR>', { silent = true, remap = true })


vim.g.table_mode_always_active = true

vim.api.nvim_create_autocmd("InsertEnter", { pattern = "*.md", callback = switch_to_tex })
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*.md", callback = switch_to_markdown })


vim.cmd(
	[[
  function! OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])
