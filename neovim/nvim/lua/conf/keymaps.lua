local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local tsuccess, telescope = pcall(require, "telescope.builtin");

-- Comments
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv", {remap = true})
keymap("v", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)gv", {remap = true})


-- Remaps
keymap("v", "$", "g_", {remap = true})
keymap("n", "-", "_", {remap = true})
keymap("v", "-", "_", {remap = true})

--  buffersize
keymap("n", "<C-Left>", require("smart-splits").resize_left, opts)
keymap("n", "<C-Down>", require("smart-splits").resize_down, opts)
keymap("n", "<C-Up>", require("smart-splits").resize_up, opts)
keymap("n", "<C-Right>", require("smart-splits").resize_right, opts)

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
keymap("n", "<Leader>o", ":only<CR>", opts)
keymap("n", "<Leader>q", ":silent! q<CR>", opts)
keymap("n", "<Leader>Q", ":%bd|e#<CR>", opts)
keymap("n", "<C-q>", ":q!<CR>", opts)
keymap("n", "U", "<C-r>", opts)

keymap("n", "<Leader>[", "<C-o>", opts)
keymap("n", "<Leader>]", "<C-i>", opts)
keymap("n", "<Leader>bl", ":ls<CR>", opts)


-- sysym copy/past
keymap("n", "<A-n>", "*N", opts)
keymap("v", "<A-c>", "\"+y", {remap = true})
keymap("n", "<A-c>", "v\"+y", {remap = true})
keymap("n", "<A-v>", "\"+p", {remap = true})
keymap("v", "<A-v>", "\"+p", {remap = true})

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
keymap("n", "<M-t>", ":tabnew<CR>", opts)
keymap("n", "<M-,>", ":tabprevious<CR>", opts)
keymap("n", "<M-.>", ":tabnext<CR>", opts)
keymap("n", "<M-<>", ":tabmove -1<CR>", opts)
keymap("n", "<M->>", ":tabmove +1<CR>", opts)

-- Git
keymap("n", "<Leader>G", ":LazyGit<CR>")
keymap("n", "<Leader>gf", ":DiffviewFileHistory %<CR>", opts)
keymap("n", "<Leader>gh", ":DiffviewFileHistory<CR>", opts)
keymap("n", "<Leader>gs", ":DiffviewOpen<CR>", opts)
-- • <leader>co: Choose the OURS version of the conflict.
-- • <leader>ct: Choose the THEIRS version of the conflict.
-- • <leader>cb: Choose the BASE version of the conflict.
-- • <leader>ca: Choose all versions of the conflict (effectively just deletes the markers, leaving all the content).
-- • dx: Choose none of the versions of the conflict (delete the
--   conflict region).


-- Netrw
keymap("n", "<Leader><Leader>", ":silent! Telescope file_browser<CR>", opts)

-- LSP
keymap("n","<Leader>d", vim.diagnostic.open_float, opts) -- show diagnostic
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "gdd", vim.lsp.buf.definition, opts)
keymap("n", "gdx", ":belowright split | lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "<Leader>R", vim.lsp.buf.rename, opts)

-- Telescope
if (tsuccess) then
	keymap("n", "<Leader>f", telescope.find_files, opts)
	keymap("n", "<Leader>p", telescope.live_grep, opts)
	keymap("n", "<Leader>s", telescope.current_buffer_fuzzy_find, opts)
	keymap("n", "<Leader>h", telescope.resume, opts)
	keymap("n", "<Leader>t", telescope.treesitter, opts)
	keymap("n", "<Leader>ad", telescope.diagnostics, opts)
	keymap("n", "<Leader>gb", telescope.git_branches, opts)
	keymap("n", "<Tab>", telescope.buffers, opts)
end

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


-- yanky
keymap("n", "<c-p>", ":Telescope yank_history<CR>", {remap = true})
keymap("n", "p", function ()
	local yanky = require("yanky")
	if yanky.can_cycle() then
		yanky.cycle(1)
	else
		yanky.put("p")
	end
end, {remap = true})
keymap("n", "P", "<Plug>(YankyCycleBackward)", {remap = true})
