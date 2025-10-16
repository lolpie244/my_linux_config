local files = {
	"autosave",
	"lspconfig",
	"formatters",
	"completion",
	"nvimtreesitter",
	"lualine",
	"dap",
	"comment",
	"etc",
	"mini",
	"git",
	"oil",
	"spellcheking",
	"big_files",
    "snacks"
}

for _, file in ipairs(files) do
	require("conf.plugins." .. file)
end


