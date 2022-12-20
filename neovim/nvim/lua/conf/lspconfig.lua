local keymap = vim.keymap.set

require("nvim-lsp-installer").setup({
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap("n", "gdd", vim.lsp.buf.definition, bufopts)
	keymap("n", "gdx", ":belowright split | lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", bufopts)
	keymap("n", "K", vim.lsp.buf.hover, bufopts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap("n", "<Leader>S", vim.lsp.buf.signature_help, bufopts)
	keymap("n", "<Leader>T", vim.lsp.buf.type_definition, bufopts)
	keymap("n", "<Leader>R", vim.lsp.buf.rename, bufopts)
	keymap("n", "gr", vim.lsp.buf.references, bufopts)
	vim.diagnostic.config({ virtual_text = false })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		--['<C-d>'] = cmp.mapping.scroll_docs(-4),
		--['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
-- lspconfig.ccls.setup {
--
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	init_options = {
-- 		compilationDatabaseDirectory = "build";
-- 		index = {
-- 		  threads = 0;
-- 	};
-- 		clang = {
-- 		  excludeArgs = { "-frounding-math"} ;
-- 		};
-- 	},
-- 	filetypes = {"h", "c", "cpp", "objc", "objcpp" }
-- }
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})


lspconfig.omnisharp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.sqls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jdtls.setup({
on_attach = on_attach,
capabilities = capabilities,
})

lspconfig.html.setup({
on_attach = on_attach,
capabilities = capabilities,
})

lspconfig.cssls.setup({
on_attach = on_attach,
capabilities = capabilities,
})
