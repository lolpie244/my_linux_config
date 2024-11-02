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


require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<CR>"] = "actions.select",
		["<C-v>"] = vertical_split,
		["<C-x>"] = split,
		["gx"] = xdg_open,
		["<Leader>v"] = "actions.select_vsplit",
		["<Leader>x"] = "actions.select_split",
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["g."] = "actions.toggle_hidden",
	},
	delete_to_trash = true
})
