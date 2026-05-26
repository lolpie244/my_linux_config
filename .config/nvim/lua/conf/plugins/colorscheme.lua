require("catppuccin").setup({
	flavour = "frappe",
	custom_highlights = function(colors)
		return {
			FloatBorder = { bg = "NONE" },
			FloatTitle = { bg = "NONE" },
		}
	end,
})
vim.cmd([[colorscheme catppuccin-nvim]])

-- C++
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
vim.api.nvim_set_hl(0, "@module", { fg = "#babbf2", italic = true })
vim.api.nvim_set_hl(0, "@keyword.import.cpp", { link = "Include" })
vim.api.nvim_set_hl(0, "@keyword.import.c", { link = "Include" })
