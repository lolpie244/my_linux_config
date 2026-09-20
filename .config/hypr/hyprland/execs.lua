---@module 'hl'

hl.on("hyprland.start", function()
    hl.exec_cmd("mako") -- notifications
    hl.exec_cmd("waybar") -- topbar
    hl.exec_cmd("awww-daemon") -- wallpaper
    hl.exec_cmd("hypridle") -- idle
    hl.exec_cmd("hyprland-per-window-layout")
    hl.exec_cmd("shikane") -- dynamic display config
    hl.exec_cmd("wl-paste --type text --watch cliphist store") -- clipboard history
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- clipboard history
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
    hl.exec_cmd("xhost +local:&")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("blueman-applet") -- bluetooth
end)
