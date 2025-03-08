local empty_setup = {
	"nvim-autopairs",
	"grug-far",
}

for _, plugin in ipairs(empty_setup) do
	require(plugin).setup()
end

require("kitty-runner").setup({
	runner = {
		delay = 100,
	},
	launch = {
		extra_launch_args = { "--copy_env" },
	},
})

require("preview").setup({
	previewers_by_ft = {
		plantuml = {
			name = "plantuml_svg",
			renderer = { type = "command", opts = { cmd = { "feh", "--keep-zoom-vp" } } },
		},
	},
	previewers = {
		plantuml_svg = {
			args = { "-pipe", "-tpng" },
		},
	},
	render_on_write = true,
})

-- Theme
vim.cmd([[colorscheme catppuccin-frappe]])

-- jupyter
require("jupynium").setup({
	auto_download_ipynb = false,
	firefox_profiles_ini_path = "~/.mozilla/firefox/profiles.ini",
})
