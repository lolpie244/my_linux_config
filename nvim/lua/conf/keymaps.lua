local keymap = vim.keymap.set 
local opts = { noremap = true, silent = true }

-- Comment
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv", {remap = true})
keymap("v", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)gv", {remap = true})

--  buffersize
keymap("n", "<C-h>", "15<C-w><", opts)
keymap("n", "<C-j>", "15<C-w>-", opts)
keymap("n", "<C-k>", "15<C-w>+", opts)
keymap("n", "<C-l>", "15<C-w>>", opts)

-- select buffer
keymap("n", "<Leader>h", "<C-w>h", opts)
keymap("n", "<Leader>j", "<C-w>j", opts)
keymap("n", "<Leader>k", "<C-w>k", opts)
keymap("n", "<Leader>l", "<C-w>l", opts)

keymap("n", "<Esc>", ":noh<CR>", opts)
keymap("n", "<Leader>o", ":only<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)
keymap("n", "<Leader>ww", ":w<CR>", opts)
keymap("n", "<Leader>wq", ":wq<CR>", opts)
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
keymap("n", "gss", ":Git stash<CR>", opts)
keymap("n", "gsp", ":Git stash pop<CR>", opts)
keymap("n", "gsl", ":Git stash list<CR>", opts)
keymap("n", "gbb", ":Git blame<CR>", opts)
-- keymap("n", "gcc", ":Git commit<CR>", opts)
keymap("n", "gps", ":Git push<CR>", opts)
keymap("n", "gpl", ":Git pull<CR>", opts)
keymap("n", "gll", ":Git log", opts)
keymap("n", "gkk", ":Git cherry-pick", opts)
keymap("n", "gkt", ":Git checkout", opts)
keymap("n", "gdd", ":Gvdiffsplit!<CR>", opts)
keymap("n", "gmm", ":Git mergetool<CR>", opts)
keymap("n", "gpc", ":diffget //2<CR>", opts)
keymap("n", "gpi", ":diffget //3<CR>", opts)

-- Netrw
keymap("n", "<Leader><Leader>", ":Telescope file_browser<CR>", opts)
keymap("n", "<Leader><Tab>", ":Texplore<CR>", opts)

-- LSP
keymap("n", "<Leader>d", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<Leader>ad", vim.diagnostic.setloclist, opts)

-- Telescope
keymap("n", "<Leader>f", function ()
	require("telescope.builtin").find_files()
end, opts)

keymap("n", "<Leader>p", function ()
	require("telescope.builtin").live_grep()
end, opts)

keymap("n", "<Leader>r", function ()
	require("telescope.builtin").oldfiles()
end, opts)

keymap("n", "<Leader>s", function ()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, opts)

keymap("n", "<Leader>m", function ()
	require("telescope.builtin").resume()
end, opts)

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
