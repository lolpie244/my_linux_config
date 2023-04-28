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
	"dapui",
	"etc",
	"mini",
	"git",
}

for _, file in ipairs(files) do
	require("conf.plugins." .. file)
end

