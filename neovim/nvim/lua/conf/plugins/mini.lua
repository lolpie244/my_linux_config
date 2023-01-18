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
	"mini.jump",
	"mini.ai",
}

for _, plugin in ipairs(empty_setup) do
	setup(plugin)
end

setup("mini.move", {
	mappings = {
		line_left = '',
		line_right = '',
		line_down = '',
		line_up = '',
	}
})
