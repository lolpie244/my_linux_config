local function setup(name, data)
	data = data or {}
	local success, instance = pcall(require, name)

	if (success) then
		instance.setup(data)
	else
		error("ERROR WHILE LOADING " .. name)
	end
end

local empty_setup = {
	"toggleterm",
	"nvim-autopairs",
	"yanky",
}

for _, plugin in ipairs(empty_setup) do
	setup(plugin)
end

-- Gitsigns
setup("gitsigns", {
		signs = {
			add    = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
			change = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
			delete = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
		}
	})

-- Theme
vim.cmd([[colorscheme catppuccin-frappe]])

-- Better scroll
setup("cinnamon", {extended_keymaps = true})

