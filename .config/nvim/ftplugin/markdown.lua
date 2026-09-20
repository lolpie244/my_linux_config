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

local function image_under_cursor()
	local line = vim.api.nvim_get_current_line()
	local path = line:match("!%[.-%]%((.-)%)")
	if not path then
		vim.notify("No image under cursor", vim.log.levels.WARN)
		return nil
	end

    return path
end

vim.api.nvim_create_user_command("DeleteImage", function()
    local path = image_under_cursor()
	if not path then
		return
	end
	os.remove(path)
    vim.api.nvim_del_current_line()
end, {})


vim.api.nvim_create_user_command("ReplaceImage", function()
    local path = image_under_cursor()
	if not path then
		return
	end
	os.remove(path)
	local name = path:match("([^/]+)%.[^.]+$")
	require("img-clip").paste_image({
		file_name = name,
		prompt_for_file_name = false,
	})
	vim.schedule(function()
		local row = vim.api.nvim_win_get_cursor(0)[1]
		vim.api.nvim_buf_set_lines(0, row - 2, row - 1, false, {})
        vim.cmd('stopinsert')
	end)
end, {})


vim.api.nvim_create_user_command("DiagramModeOn", function()
    vim.cmd('set ve=all')
end, {})

vim.api.nvim_create_user_command("DiagramModeOff", function()
    vim.cmd('set ve=onemore')
end, {})
