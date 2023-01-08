local function setup(name, data)
	data = data or {}
	local success, instance = pcall(require, name)

	if (success) then
		instance.setup(data)
	end
end


-- Toggleterm
setup("toggleterm")

-- Autopairs
setup("autopairs")

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

-- Autopairs
setup("range-highlight")

-- Better scroll
setup("cinnamon", {extended_keymaps = true})
