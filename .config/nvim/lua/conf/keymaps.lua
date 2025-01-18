local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local tsuccess, telescope = pcall(require, "telescope.builtin");

-- Comments
keymap("n", "<M-/>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<M-/>", "<Plug>(comment_toggle_linewise_visual)gv", {remap = true})
keymap("v", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)gv", {remap = true})


-- Remaps
keymap("v", "$", "g_", {remap = true})
keymap({"n", "v"}, "-", "_", {remap = true})
keymap("i", "<C-Space>", "<Space>", {remap = true})

--  buffersize
keymap("n", "<C-Left>", require("smart-splits").resize_left, opts)
keymap("n", "<C-Down>", require("smart-splits").resize_down, opts)
keymap("n", "<C-Up>", require("smart-splits").resize_up, {remap = true})
keymap("n", "<C-Right>", require("smart-splits").resize_right, {remap = true})

keymap("n", "<C-h>", require("smart-splits").resize_left, opts)
keymap("n", "<C-j>", require("smart-splits").resize_down, opts)
keymap("n", "<C-k>", require("smart-splits").resize_up, opts)
keymap("n", "<C-l>", require("smart-splits").resize_right, opts)


-- select buffer
keymap("n", "<M-Left>", require("smart-splits").move_cursor_left, opts)
keymap("n", "<M-Down>", require("smart-splits").move_cursor_down, opts)
keymap("n", "<M-Up>", require("smart-splits").move_cursor_up, opts)
keymap("n", "<M-Right>", require("smart-splits").move_cursor_right, opts)

keymap("n", "<M-h>", require("smart-splits").move_cursor_left, opts)
keymap("n", "<M-j>", require("smart-splits").move_cursor_down, opts)
keymap("n", "<M-k>", require("smart-splits").move_cursor_up, opts)
keymap("n", "<M-l>", require("smart-splits").move_cursor_right, opts)

keymap("n", "<Esc>", ":noh<CR>", opts)
keymap("n", "<Leader>w", ":silent! w<CR>", opts)
keymap("n", "<Leader>q", ":silent! q<CR>", opts)
keymap("n", "<C-q>", ":q!<CR>", opts)
keymap("n", "U", "<C-r>", opts)

keymap("n", "<Leader>[", "<C-o>", opts)
keymap("n", "<Leader>]", "<C-i>", opts)

-- sysym copy/past
keymap("v", "<A-c>", "\"+y", {remap = true})
keymap("n", "<A-c>", "v\"+y", {remap = true})
keymap({"n", "v"}, "<A-v>", "\"+p", {remap = true})
keymap("v", "p", '"_dP', opts)

-- duplicate line
keymap("n", "<M-d>", "yyp", opts)
keymap("v", "<M-d>", "y'>o<Esc>p", {remap = true})

-- select all
keymap("n", "<A-a>", "ggVG", opts)

-- select line
keymap("n", "V", "V0", opts)

-- tab
keymap("v", ">", ">gv", {remap = true})
keymap("n", ">", ">>", {remap = true})

keymap("v", "<", "<gv", {remap = true})
keymap("n", "<", "<<", {remap = true})

-- tabs
keymap("n", "<M-T>", "<C-w>T", opts)
keymap("n", "<M-t>", ":tabnew<CR>", opts)
keymap("n", "<C-T>", ":tabclose<CR>", opts)
keymap("n", "<M-,>", ":tabprevious<CR>", opts)
keymap("n", "<M-.>", ":tabnext<CR>", opts)
keymap("n", "<M-<>", ":tabmove -1<CR>", opts)
keymap("n", "<M->>", ":tabmove +1<CR>", opts)

-- Git
keymap("n", "<Leader>G", ":LazyGit<CR>")
keymap("n", "<Leader>gf", ":DiffviewFileHistory %<CR>", opts)
keymap("n", "<Leader>gh", ":DiffviewFileHistory<CR>", opts)
keymap("n", "<Leader>gs", ":DiffviewOpen<CR>", opts)


-- Netrw
keymap("n", "<Leader><Leader>", ":Oil<CR>", opts)

-- LSP
keymap("n", "<Leader>F", require("conform").format, opts) -- format file
keymap("n","<Leader>d", ":Lspsaga diagnostic_jump_next<CR>", opts) -- show diagnostic
keymap("n", "gdd", vim.lsp.buf.definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "gdx", ":belowright split | lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "<Leader>R", vim.lsp.buf.rename, opts)
keymap("n", "<Leader>o", ":Lspsaga outline<CR>", opts)


-- Telescope
if (tsuccess) then
	keymap("n", "<Leader>f", telescope.find_files, opts)
	keymap("n", "<Leader>p", telescope.live_grep, opts)
	keymap("n", "<Leader>s", telescope.current_buffer_fuzzy_find, opts)
	keymap("n", "<Leader>H", telescope.resume, opts)
	keymap("n", "<Leader>t", telescope.treesitter, opts)
	keymap("n", "<Leader>ad", telescope.diagnostics, opts)
	keymap("n", "<Tab>", telescope.buffers, opts)
end

-- Terminal
keymap('t', "<Leader><Leader>", [[<C-\><C-n>]], opts)


-- dap (debuger)
keymap("n", "<F5>", "<Cmd>lua require'dapui'.open()<CR><Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<Leader><Tab>", "<Cmd>lua require'dapui'.toggle()<CR>", opts)
keymap("n", "<C-b>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<C-n>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)

-- harpoon (file marker)
keymap("n", "<Leader>a", require("harpoon.mark").add_file, opts)
keymap("n", "<Leader>h", require("harpoon.ui").toggle_quick_menu, opts)

-- kitty runner
keymap("n", "<Leader>rc", require("kitty-runner").clear, opts)

-- surround
keymap("n", "Sd", "<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)", {remap = true})
keymap("v", "Sd", "<Plug>(operator-sandwich-delete)", {remap = true})
keymap("n", "Sr", "<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)")
keymap("v", "Sr", "<Plug>(operator-sandwich-replace)")
keymap({"n", "v"}, "Sa", "<Plug>(operator-sandwich-add)")
keymap("o", "Sa", "<Plug>(operator-sandwich-g@)")

-- ETC
keymap("n", "<C-Space>", '<Plug>(zoom-toggle)', opts) -- zoom
keymap("n", "<C-R>", require('grug-far').open, opts) -- replace
keymap("n", "<Leader>u", vim.cmd.UndotreeToggle, opts) -- undotree
keymap("i", "<C-z>", "<C-^>") -- language
