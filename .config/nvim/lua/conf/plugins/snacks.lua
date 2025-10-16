vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
	end,
})

return {
	"folke/snacks.nvim",
	opts = {
		image = {
			doc = {
				inline = true,
				float = false,
			},
		},
		picker = {
			hidden = true,
			-- ignored = true,
			exclude = {
				"**/.git/*",
				"**/node_modules/*",
				"**/venv/*",
				"**/.venv/*",
				"**/^build/*",
				"**/__pycache__/*",
			},
			win = {
				input = {
					keys = {
						["<C-Space>"] = { "toggle_live", mode = { "i", "n" } },
						["<M-q>"] = { "qflist", mode = { "i", "n" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
					},
				},
			},

			sources = {
				files = {
					hidden = true,
					ignored = true,
				},
			},

			layout = {
				layout = {
					box = "vertical",
					backdrop = false,
					width = 0.8,
					height = 0.95,
					border = "none",

					{
						win = "preview",
						title = "{preview:Preview}",
						border = "rounded",
						title_pos = "center",
						height = 0.68,
					},
					{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
					{
						win = "input",
						height = 1,
						border = "rounded",
						title = "{title} {live} {flags}",
						title_pos = "center",
					},
				},
			},
		},
	},
}
