---@module 'hl'

-- Apps
local apps = {
	terminal = "kitty",
	file_manager = "nautilus",
	browser = "firefox",
	editor = "nvim",
	menu = "tofi-drun -c ~/.config/tofi/configA --drun-launch=true",
}
hl.bind("SUPER + Return", hl.dsp.exec_cmd(apps.terminal))
hl.bind("SUPER + B", hl.dsp.exec_cmd(apps.browser))
hl.bind("SUPER + C", hl.dsp.exec_cmd(apps.editor))
hl.bind("SUPER + E", hl.dsp.exec_cmd(apps.file_manager))
hl.bind("SUPER + D", hl.dsp.exec_cmd(apps.menu))

-- Grouped
hl.bind("SUPER + W", hl.dsp.group.toggle())
hl.bind("SUPER + N", hl.dsp.group.next({ forward = false }))
hl.config({
	binds = {
		movefocus_cycles_fullscreen = false,
	},
})

-- Other
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

-- Clipboard
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy"))

-- Screen locking
hl.bind("SUPER + Backspace", hl.dsp.exec_cmd("hyprlock"))

-- wlogout
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("wlogout"))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify copysave screen"))

-- Entire screen + clipboard copy
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grimblast --freeze --notify copysave active"))

-- Select area to take screenshot
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimblast --freeze --notify copysave area"))

-- Navigation
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))

-- Move windows
hl.bind("SUPER + ALT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + ALT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + ALT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + ALT + l", hl.dsp.window.move({ direction = "right" }))

-- Resize windows
hl.bind("SUPER + CTRL + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })

-- Move to other workspace
hl.bind("SUPER + SHIFT + j", hl.dsp.focus({ workspace = "e-1" }), { repeating = true })
hl.bind("SUPER + SHIFT + k", hl.dsp.focus({ workspace = "e+1" }), { repeating = true })
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ workspace = "m-1" }), { repeating = true })
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ workspace = "m+1" }), { repeating = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Volume
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ repeating = true, locked = true }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ repeating = true, locked = true }
)

-- Screen brightness
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -d intel_backlight set 5%+"),
	{ repeating = true, locked = true }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -d intel_backlight set 5%-"),
	{ repeating = true, locked = true }
)

-- Media control
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

local function change_zoom(amount)
	local current = hl.get_config("cursor.zoom_factor") or 1.0
	local new_zoom = current + amount

	if new_zoom < 1.0 then
		new_zoom = 1.0
	end
	hl.config({ cursor = { zoom_factor = new_zoom } })
end

-- Zoom in
hl.bind("SUPER + CTRL + mouse_up", function()
	change_zoom(0.5)
end)

-- Zoom out
hl.bind("SUPER + CTRL + mouse_down", function()
	change_zoom(-0.5)
end)
