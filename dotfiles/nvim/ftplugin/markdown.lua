local keymap = vim.keymap.set
local current_filetype = "markdown"


local function switch_filetype()
	if current_filetype == "markdown" then
		current_filetype = "tex"
		require("nabla").disable_virt()
	else
		current_filetype = "markdown"
		require("nabla").enable_virt({ align_center = true, autogen = true })
	end

	vim.cmd(":set filetype=" .. current_filetype)
	print(current_filetype)
end


keymap("n", "<leader>ms", switch_filetype, { silent = true, remap = true })
keymap("n", "<leader>mt", ':TableModeRealign<CR>', { silent = true, remap = true })


vim.g.table_mode_always_active = true
require("nabla").enable_virt({ align_center = true, autogen = true })

vim.cmd(
	[[
  function! OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
  let g:markdown_fenced_languages = ['cpp', 'python', 'lua', 'cs', 'typescript', 'javascript']
]])
