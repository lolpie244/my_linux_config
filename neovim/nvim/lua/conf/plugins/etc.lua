local function setup(name, data)
	data = data or {}
	local success, instance = pcall(require, name)

	if (success) then
		instance.setup(data)
	else
		error("ERROR WHILE LOADING " .. name)
	end
end

local empty_setup = {
	"toggleterm",
	"nvim-autopairs",
	"spectre"
}

for _, plugin in ipairs(empty_setup) do
	setup(plugin)
end


-- Theme
vim.cmd([[colorscheme catppuccin-frappe]])

-- Better scroll
setup("cinnamon", {extended_keymaps = true})
