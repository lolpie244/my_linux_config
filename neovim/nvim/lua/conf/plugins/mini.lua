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
	"mini.move"
}

for _, plugin in ipairs(empty_setup) do
	setup(plugin)
end
