local lsp_servers_mason = {
	"pyright",
	"neocmake",
	"jsonls",
	"sqlls",
	"yamlls",
	"dockerls",
	"bashls",
	"texlab",
	"jdtls",
	"html",
	"cssls",
	"rust_analyzer",
	"omnisharp",
	"lua_ls",
	"marksman",
	"gopls",
	"mesonlsp",
}

local lsp_servers_local = {
	"clangd",
}

-- INSTALL LSP
local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup()
lspconfig.setup {
	ensure_installed = lsp_servers_mason
}

local lsp_servers = vim.list_extend(lsp_servers_local, lsp_servers_mason)

-- SETUP LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

vim.diagnostic.config({ virtual_text = false })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "prolog_ls" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

local default_config = { capabilities = capabilities }

for _, server in ipairs(lsp_servers) do
	vim.lsp.config(server, default_config)
end

vim.lsp.config('clangd', {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

vim.lsp.config('prolog_ls', default_config)
vim.lsp.config('glslls', {
	capabilities = capabilities,
	cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
})

vim.lsp.enable(lsp_servers)
vim.lsp.enable({ 'prolog_ls', 'glslls' })

require('lspsaga').setup({
	outline = {
		close_after_jump = true,
		layout = "float",
		keys = {
			toggle_or_jump = "<Leader>",
			jump = "<Enter>"
		},
        max_height = 0.7,
        left_width = 0.4
	},
	lightbulb = {
		enable = false
	},
	symbol_in_winbar = {
		show_file = false
	},
})
