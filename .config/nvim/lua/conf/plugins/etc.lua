local empty_setup = {
	"nvim-autopairs",
	"spectre"
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
