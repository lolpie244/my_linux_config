---@module 'hl'

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
	debug = {
		disable_logs = true,
		full_cm_proto = true,
	},
	gestures = {
		workspace_swipe_distance = 700,
		workspace_swipe_cancel_ratio = 0.2,
		workspace_swipe_min_speed_to_force = 5,
		workspace_swipe_direction_lock = true,
		workspace_swipe_direction_lock_threshold = 10,
		workspace_swipe_create_new = true,
	},
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
		col = {
			active_border = "rgb(687eb3)",
			inactive_border = "rgb(24273A)",
		},
	},
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = true,
			size = 3,
			passes = 3,
			new_optimizations = true,
			vibrancy = 0.1696,
			ignore_opacity = true,
		},
	},
	animations = {
		enabled = true,
	},
	input = {
		kb_layout = "us, ua",
		kb_options = "grp:win_space_toggle,caps:super",
		follow_mouse = 1,
		sensitivity = 0.3,
		accel_profile = "flat",
		touchpad = {
			natural_scroll = true,
		},
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0,
	},
	dwindle = {
		preserve_split = true,
	},
    cursor = {
        zoom_rigid = false,
        zoom_detached_camera = false
    }
})

hl.gesture({
	["fingers"] = 3,
	["direction"] = "horizontal",
	["action"] = "workspace",
})

hl.curve("wind", {
	type = "bezier",
	points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})
hl.curve("winIn", {
	type = "bezier",
	points = { { 0.1, 1.1 }, { 0.1, 1.1 } },
})
hl.curve("winOut", {
	type = "bezier",
	points = { { 0.3, -0.3 }, { 0, 1 } },
})
hl.curve("liner", {
	type = "bezier",
	points = { { 1, 1 }, { 1, 1 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind" })
