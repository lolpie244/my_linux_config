local files = {
	"autosave",
	"lspconfig",
	"formatters",
	"completion",
	"nvimtreesitter",
	"lualine",
	"telescope",
	"dap",
	"comment",
	"etc",
	"mini",
	"git",
	"oil",
	"spellcheking",
	"big_files",
}

for _, file in ipairs(files) do
	require("conf.plugins." .. file)
end


