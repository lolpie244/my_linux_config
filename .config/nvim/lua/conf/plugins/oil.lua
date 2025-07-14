local oil = require("oil")

function get_current_file()
	local cwd = oil.get_current_dir()
	local entry = oil.get_cursor_entry()
	if cwd and entry then
		return string.format("%s/%s", cwd, entry.name)
	end
	return nil
end

local select = function(params)
	oil.select(params)
	vim.cmd.wincmd({ args = { "p" } })
	oil.close()
	vim.cmd.wincmd({ args = { "p" } })
end

local vertical_split = function()
	select({ vertical = true })
end

local split = function()
	select({ horizontal = true })
end

local xdg_open = function ()
	local file = get_current_file()
	if file then
		vim.fn.jobstart({ "xdg-open", file })
	end
end

local compress = function ()
    local cwd = oil.get_current_dir()
    local entry = oil.get_cursor_entry()

    if not cwd or not entry then
        return
    end

    local cmd = string.format("cd %s; zip -r %s.zip %s", cwd, entry.name, entry.name)

    local loading = require("oil.loading")
    local bufnr = vim.api.nvim_get_current_buf()
    loading.set_loading(bufnr, true)

    require("oil.shell").run(cmd, {}, function ()
        loading.set_loading(bufnr, false)
        vim.cmd [[silent! edit]]
    end)
end


require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<CR>"] = "actions.select",
		["gv"] = vertical_split,
		["gs"] = split,
		["Gv"] = "actions.select_vsplit",
		["Gs"] = "actions.select_split",
		["gx"] = xdg_open,
        ["<C-z>"] = compress,
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["-"] = "actions.parent",
		["~"] = "actions.cd",
		["`"] = "actions.tcd",
		["g."] = "actions.toggle_hidden",
	},
	delete_to_trash = true
})
