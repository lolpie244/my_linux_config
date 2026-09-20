---@module 'hl'

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
	name = "windowrule-2",
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "windowrule-3",
	match = {
		class = "^$",
		title = "^$",
		xwayland = 1,
		float = 1,
		fullscreen = 0,
		pin = 0,
	},
	no_focus = true,
})

hl.window_rule({
	name = "windowrule-4",
	match = {
		class = "^(Thorium-browser)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-5",
	match = {
		class = "^(Code)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-6",
	match = {
		class = "^(Arduino IDE)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-7",
	match = {
		class = "^(dev.warp.Warp)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-8",
	match = {
		class = "^(code-url-handler)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-9",
	match = {
		class = "^(code-insiders-url-handler)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-10",
	match = {
		class = "^(kitty)$",
	},
	opacity = "0.9 0.9",
})

hl.window_rule({
	name = "windowrule-11",
	match = {
		class = "^(org.kde.ark)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-12",
	match = {
		class = "^(nwg-look)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-13",
	match = {
		class = "^(qt5ct)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-14",
	match = {
		class = "^(qt6ct)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-15",
	match = {
		class = "^(kvantummanager)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-16",
	match = {
		class = "^(pavucontrol)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-17",
	match = {
		class = "^(blueman-manager)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-18",
	match = {
		class = "^(nm-applet)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-19",
	match = {
		class = "^(Spotify)$",
	},
	opacity = "0.70 0.70",
})

hl.window_rule({
	name = "windowrule-20",
	match = {
		initial_title = "^(Spotify Free)$",
	},
	opacity = "0.70 0.70",
})

hl.window_rule({
	name = "windowrule-21",
	match = {
		class = "^(nm-connection-editor)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-22",
	match = {
		class = "^(org.kde.polkit-kde-authentication-agent-1)$",
	},
	opacity = "0.90 0.90",
	float = true,
})

hl.window_rule({
	name = "windowrule-23",
	match = {
		class = "^(polkit-gnome-authentication-agent-1)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-24",
	match = {
		class = "^(org.freedesktop.impl.portal.desktop.gtk)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-25",
	match = {
		class = "^(org.freedesktop.impl.portal.desktop.hyprland)$",
	},
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "wl-mirror-screenshare",
	match = {
		class = "^(at.yrlf.wl_mirror)$",
	},
	float = true,
    min_size = {1920, 1080},
    max_size = {1920, 1080},
})

hl.layer_rule({
	match = {
		namespace = "tofi",
	},
	ignore_alpha = 0,
})

hl.layer_rule({
	match = {
		namespace = "dunst",
	},
	ignore_alpha = 0,
	blur = true,
})


