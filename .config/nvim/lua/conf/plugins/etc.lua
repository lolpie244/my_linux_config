local empty_setup = {
	"nvim-autopairs",
	"spectre",
}

for _, plugin in ipairs(empty_setup) do
	require(plugin).setup()
end

require("kitty-runner").setup({
	runner = {
		delay = 100,
	},
	launch = {
		extra_launch_args = { "--copy_env" }
	}
})


-- Theme
vim.cmd([[colorscheme catppuccin-frappe]])



-- jupyter
require("jupynium").setup({
	auto_download_ipynb = false,
	firefox_profiles_ini_path = "~/.mozilla/firefox/profiles.ini"
})
