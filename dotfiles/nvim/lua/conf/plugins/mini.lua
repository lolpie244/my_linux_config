local empty_setup = {
	"mini.jump",
	"mini.ai",
}

for _, plugin in ipairs(empty_setup) do
	require(plugin).setup()
end

