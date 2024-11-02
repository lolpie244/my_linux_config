local lsp_servers = {
	"clangd",
	"pyright",
	"cmake",
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
	"ltex",
	"gopls",
}

-- INSTALL LSP
local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup()
lspconfig.setup {
	ensure_installed = lsp_servers
}

-- SETUP LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.diagnostic.config({ virtual_text = false })

	if client.name == "prolog_ls" then
		client.server_capabilities.semanticTokensProvider = nil
	end
end
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)


for _, server in ipairs(lsp_servers) do
	lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
end


lspconfig.clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}

require("lspconfig").ltex.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		require("ltex_extra").setup()
	end
}

lspconfig.prolog_ls.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.glslls.setup {
    cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
}

require('lspsaga').setup({
	outline = {
		close_after_jump = true,
		layout = "float",
		keys = {
			toggle_or_jump = "<Leader>",
			jump = "<Enter>"
		}
	},
	lightbulb = {
		enable = false
	},
	symbol_in_winbar = {
		show_file = false
	},
})
