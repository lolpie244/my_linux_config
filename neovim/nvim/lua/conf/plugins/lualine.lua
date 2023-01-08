require("lualine").setup({
	options = {
		icons_enabled = false,
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
		theme = 'OceanicNext',
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename', path = 1}},
		lualine_x = {'encoding', 'fileformat', {'filetype', padding = { left = 2, right = 3}}},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
})
