require("nvim-lsp-installer").setup({automatic_installation = true,})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig_success, lspconfig = pcall(require, "lspconfig")
local cmp_lsp_success, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.diagnostic.config({ virtual_text = false })
end

if (not (lspconfig_success and cmp_lsp_success)) then
	return
end

capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local servers = {
	lspconfig.clangd,
	lspconfig.pyright,
	lspconfig.omnisharp,
	lspconfig.cmake,
	lspconfig.jsonls,
	lspconfig.sqls,
	lspconfig.yamlls,
	lspconfig.dockerls,
	lspconfig.bashls,
	lspconfig.texlab,
	lspconfig.jdtls,
	lspconfig.html,
	lspconfig.cssls,
	lspconfig.sumneko_lua
}

for _, server in ipairs(servers) do
	server.setup({ on_attach = on_attach, capabilities = capabilities })
end

