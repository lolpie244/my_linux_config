local files = {
	"autosave",
	"lspconfig",
	"completion",
	"nvimtreesitter",
	"lualine",
	"telescope",
	"dap",
	"true_zen",
	"comment",
	"dapui",
	"etc",
	"mini",
	"git",
}

for _, file in ipairs(files) do
	require("conf.plugins." .. file)
end

