local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local tsuccess, telescope = pcall(require, "telescope.builtin");

-- Comments
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv", {remap = true})
keymap("v", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)gv", {remap = true})

--  buffersize
keymap("n", "<S-C-h>", "2<C-w>>", {remap = true, silent = true})
keymap("n", "<S-C-j>", "2<C-w>+", {remap = true, silent = true})
keymap("n", "<S-C-k>", "2<C-w>-", {remap = true, silent = true})
keymap("n", "<S-C-l>", "2<C-w><", {remap = true, silent = true})


keymap("n", "<C-Left>", require("smart-splits").resize_left, opts)
keymap("n", "<C-Down>", require("smart-splits").resize_down, opts)
keymap("n", "<C-Up>", require("smart-splits").resize_up, opts)
keymap("n", "<C-Right>", require("smart-splits").resize_right, opts)


-- select buffer
keymap("n", "<M-Left>", require("smart-splits").move_cursor_left, opts)
keymap("n", "<M-Down>", require("smart-splits").move_cursor_down, opts)
keymap("n", "<M-Up>", require("smart-splits").move_cursor_up, opts)
keymap("n", "<M-Right>", require("smart-splits").move_cursor_right, opts)

keymap("n", "H", "<C-w>h", opts)
keymap("n", "J", "<C-w>j", opts)
keymap("n", "K", "<C-w>k", opts)
keymap("n", "L", "<C-w>l", opts)


keymap("n", "<Esc>", ":noh<CR>", opts)
keymap("n", "<Leader>o", ":only<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)
keymap("n", "<C-q>", ":q!<CR>", opts)
-- keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "U", "<C-r>", opts)

keymap("n", "<Leader>[", "<C-^>", opts)
keymap("n", "<Leader>]", ":bn<CR>", opts)
keymap("n", "<Leader>bl", ":ls<CR>", opts)


-- sysym copy/past
keymap("n", "<A-n>", "*N", opts)
keymap("v", "<A-c>", "\"+y", {remap = true})
keymap("n", "<A-c>", "v\"+y", {remap = true})
keymap("n", "<A-v>", "\"+p", {remap = true})
keymap("v", "<A-v>", "s<Esc>\"+p", {remap = true})

-- duplicate line
keymap("n", "<C-d>", "yyp", opts)
keymap("v", "<C-d>", "y'>o<Esc>p", {remap = true})

-- select all
keymap("n", "<A-a>", "ggVG", opts)

-- tab
keymap("v", ">", ">gv", {remap = true})
keymap("n", ">", ">>", {remap = true})

keymap("v", "<", "<gv", {remap = true})
keymap("n", "<", "<<", {remap = true})

-- tabs
keymap("n", "<M-,>", ":tabprevious<CR>", opts)
keymap("n", "<M-.>", ":tabnext<CR>", opts)
keymap("n", "<M-<>", ":tabmove -1<CR>", opts)
keymap("n", "<M->>", ":tabmove +1<CR>", opts)

-- Git
keymap("n", "<Leader>gg", ":Git<CR>", opts)
keymap("n", "<Leader>gv", ":Gvdiffsplit!<CR>", opts)
keymap("n", "<Leader>gm", ":Git mergetool<CR>", opts)
keymap("n", "dgh", ":diffget //2<CR>", opts)
keymap("n", "dgi", ":diffget //3<CR>", opts)

-- Netrw
keymap("n", "<Leader><Leader>", ":Telescope file_browser<CR>", opts)
-- keymap("n", "<Leader><Tab>", ":Texplore<CR>", opts)

-- LSP
keymap("n","<Leader>d", vim.diagnostic.open_float, opts) -- show diagnostic
keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- previous diagnostic
keymap("n", "]d", vim.diagnostic.goto_next, opts) -- next diagnostic
keymap("n", "=d", vim.lsp.buf.code_action, opts) -- all diagnostic
-- keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "gr", require('telescope.builtin').lsp_references, opts)
-- keymap("n", "K", vim.lsp.buf.hover, opts)

-- Telescope
if (tsuccess) then
	keymap("n", "<Leader>f", telescope.find_files, opts)
	keymap("n", "<Leader>p", telescope.live_grep, opts)
	keymap("n", "<Leader>h", telescope.oldfiles, opts)
	keymap("n", "<Leader>s", telescope.current_buffer_fuzzy_find, opts)
	keymap("n", "<Leader>m", telescope.resume, opts)
	keymap("n", "<Leader>t", telescope.treesitter, opts)
	keymap("n", "<Leader>ad", telescope.diagnostics, opts)
	keymap("n", "<Leader>gb", telescope.git_branches, opts)
	keymap("n", "<Leader>gs", telescope.git_stash, opts)
	keymap("n", "<Leader>gf", telescope.git_status, opts)
	keymap("n", "<Tab>", telescope.buffers, opts)
end
keymap("n", "<Leader>G", ":LazyGit<CR>")
-- Terminal
keymap('t', "<Leader><Leader>", [[<C-\><C-n>]], opts)
keymap('t', "<Leader>q", [[<C-c><C-\><C-n>:q<CR>]], opts)
keymap('t', "<S-Left>", [[<Cmd>wincmd h<CR>]], opts)
keymap('t', "<S-Down>", [[<Cmd>wincmd j<CR>]], opts)
keymap('t', "<S-Up>" , [[<Cmd>wincmd k<CR>]], opts)
keymap('t', "<C-S-Up>" , [[<C-\><C-n>:ToggleTerm<CR>]], opts)
keymap('n', "<C-S-Up>" , ":ToggleTerm<CR>", opts)
keymap('t', "<S-Right>", [[<Cmd>wincmd l<CR>]], opts)


-- dap (debuger)
keymap("n", "<F5>", "<Cmd>lua require'dapui'.open()<CR><Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<Leader><Tab>", "<Cmd>lua require'dapui'.toggle()<CR>", opts)
keymap("n", "B", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "N", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)



-- True zen
function TrueZenNarrowAndFocus()
	if (vim.b.tz_narrowed_buffer) then
		pcall(require("true-zen.narrow").off)
	else
		pcall(require("true-zen.focus").toggle)
	end
end
keymap("n", "<C-Space>", ':<CR><cmd>lua TrueZenNarrowAndFocus()<CR>', opts)
keymap("v", "<C-Space>", ":'<,'>TZNarrow<CR>", opts)

