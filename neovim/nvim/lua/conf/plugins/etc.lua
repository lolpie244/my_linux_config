local empty_setup = {
	"toggleterm",
	"nvim-autopairs",
	"spectre"
}

for _, plugin in ipairs(empty_setup) do
	require(plugin).setup()
end


-- Theme
vim.cmd([[colorscheme catppuccin-frappe]])

-- Better scroll
require("cinnamon").setup({extended_keymaps = true})
