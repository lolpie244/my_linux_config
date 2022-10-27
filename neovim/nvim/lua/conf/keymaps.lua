local keymap = vim.keymap.set 
local opts = { noremap = true, silent = true }
local tsuccess, telescope = pcall(require, "telescope.builtin");

-- Comments
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv", {remap = true})
keymap("v", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)gv", {remap = true})

--  buffersize
keymap("n", "<C-h>", "15<C-w>>", opts)
keymap("n", "<C-j>", "15<C-w>+", opts)
keymap("n", "<C-k>", "15<C-w>-", opts)
keymap("n", "<C-l>", "15<C-w><", opts)


keymap("n", "<S-Left>", "5<C-w><", opts)
keymap("n", "<S-Down>", "5<C-w>-", opts)
keymap("n", "<S-Up>", "5<C-w>+", opts)
keymap("n", "<S-Right>", "5<C-w>>", opts)


-- select buffer
keymap("n", "<Leader><Left>", "<C-w>h", opts)
keymap("n", "<Leader><Down>", "<C-w>j", opts)
keymap("n", "<Leader><Up>", "<C-w>k", opts)
keymap("n", "<Leader><Right>", "<C-w>l", opts)

keymap("n", "<Leader>R", "<C-w>h", opts)
keymap("n", "<Leader>D", "<C-w>j", opts)
keymap("n", "<Leader>k", "<C-w>k", opts)
keymap("n", "<Leader>l", "<C-w>l", opts)

-- close buffer
keymap("n", "<Leader>bd", ":bd<CR>", opts)

-- close tab
keymap("n", "<C-t>", ":tabclose<CR>", {remap = true})


keymap("n", "<Esc>", ":noh<CR>", opts)
keymap("n", "<Leader>o", ":only<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)
keymap("n", "<C-q>", ":q!<CR>", opts)
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "U", "<C-r>", opts)

keymap("n", "<Leader>bb", "<C-^>", opts)
keymap("n", "<Leader>bn", ":bn<CR>", opts)
keymap("n", "<Leader>bp", ":bp<CR>", opts)
keymap("n", "<Leader>bl", ":ls<CR>", opts)


-- sysym copy/past
keymap("n", "<A-n>", "*N", opts)
keymap("v", "<A-c>", "\"+y", {remap = true})
keymap("n", "<A-v>", "\"+p", {remap = true})
keymap("v", "<A-v>", "d\"+P", {remap = true})

-- duplicate line
keymap("n", "<C-d>", "yyp", opts)
keymap("v", "<C-d>", "y'>o<Esc>p", {remap = true})

-- tab
keymap("v", ">", ">gv", {remap = true})
keymap("n", ">", ">>", {remap = true})

keymap("v", "<", "<gv", {remap = true})
keymap("n", "<", "<<", {remap = true})


-- Git
keymap("n", "<Leader>gg", ":Git<CR>", opts)

-- Netrw
keymap("n", "<Leader><Leader>", ":Telescope file_browser<CR>", opts)
-- keymap("n", "<Leader><Tab>", ":Texplore<CR>", opts)

-- LSP
keymap("n","<Leader>d", vim.diagnostic.open_float, opts) -- show diagnostic
keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- previous diagnostic
keymap("n", "]d", vim.diagnostic.goto_next, opts) -- next diagnostic
keymap("n", "<Leader>ad", vim.diagnostic.setloclist, opts) -- all diagnostic

-- Telescope
if (tsuccess) then
	keymap("n", "<Leader>f", telescope.find_files, opts) -- search files
	keymap("n", "<Leader>p", telescope.live_grep, opts) -- search in all files
	keymap("n", "<Leader>h", telescope.oldfiles, opts) -- show recent files
	keymap("n", "<Leader>s", telescope.current_buffer_fuzzy_find, opts) -- search in file
	keymap("n", "<Leader>m", telescope.resume, opts)
	keymap("n", "<Leader>t", telescope.treesitter, opts) -- show all function/vars/classes in file
	-- keymap("n", "<Leader><Leader>h", telescope.search_history, opts)
	keymap("n", "<Tab>", telescope.buffers, opts)
	keymap("n", "<Leader>gl", telescope.git_status, opts) -- git files
	keymap("n", "<Leader>gb", telescope.git_branches, opts) -- gi brances
end

-- Terminal
keymap('t', "<esc>", [[<C-\><C-n>]], opts)
keymap('t', "<Leader>q", [[<C-\><C-n>:q<CR>]], opts)
keymap('t', "<S-Left>", [[<Cmd>wincmd h<CR>]], opts)
keymap('t', "<S-Down>", [[<Cmd>wincmd j<CR>]], opts)
keymap('t', "<S-Up>" , [[<Cmd>wincmd k<CR>]], opts)
keymap('t', "<C-S-Up>" , [[<C-\><C-n>:ToggleTerm<CR>]], opts)
keymap('n', "<C-S-Up>" , ":ToggleTerm<CR>", opts)
keymap('t', "<S-Right>", [[<Cmd>wincmd l<CR>]], opts)




-- Netrw
vim.api.nvim_create_autocmd(
	"FileType",
	{
		pattern = "netrw",
		callback = function ()
			keymap("n", "o", "<cr>", { remap = true, buffer = 0 })
			keymap("n", "a", "%", { remap = true, buffer = 0 })
			keymap("n", "r", "<C-l>", { remap = true, buffer = 0 })
		end,
	}
)

-- dap (debuger)
keymap("n", "<F5>", "<Cmd>lua require'dapui'.open()<CR><Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<Leader><Tab>", "<Cmd>lua require'dapui'.toggle()<CR>", opts)
keymap("n", "B", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "N", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)

