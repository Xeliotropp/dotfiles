local main_mod = "SUPER"

require("programs")
-- Mouse
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media / brightness keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh volume_up"),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh volume_down"),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh volume_mute"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh mic_mute"),        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh brightness_up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh brightness_down"), { locked = true, repeating = true })

-- Apps
hl.bind(main_mod .. " + Return", hl.dsp.exec_cmd(terminal), { locked = true, repeating = true })
hl.bind("CTRL + SHIFT + Return", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(main_mod .. " + B",         hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + O",         hl.dsp.exec_cmd(notes))

-- Window management
hl.bind(main_mod .. " + Q",         hl.dsp.window.close(),{ locked = true, repeating = true })
hl.bind("CTRL + ALT + Delete",      hl.dsp.exit())
hl.bind(main_mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + F",         hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(main_mod .. " + SHIFT + P",         hl.dsp.window.pseudo())
hl.bind(main_mod .. " + W",         hl.dsp.group.toggle())

hl.bind(main_mod .. " +  P", function ()
    
    hl.dispatch(hl.dsp.window.move({ workspace = "special:minimize" }))

end)


hl.bind(main_mod .. " + S", function ()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "e+0"}))
end)

-- Launcher / tools
hl.bind(main_mod .. " + Space",       hl.dsp.exec_cmd(menu))
hl.bind("CTRL + ALT + Escape",       hl.dsp.exec_cmd("hyprlock"))
hl.bind("CTRL + SHIFT + Escape",     hl.dsp.exec_cmd("kitty btop"))
hl.bind(main_mod .. " + SHIFT + W",   hl.dsp.exec_cmd("~/.config/scripts/hyprpaper.sh"))
hl.bind(main_mod .. " + SHIFT + R",   hl.dsp.exec_cmd("hyprctl reload && pkill waybar; waybar &"))
hl.bind(main_mod .. " + SHIFT + S",   hl.dsp.exec_cmd("flameshot gui"))
hl.bind(main_mod .. " + V",           hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

-- Focus
hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move windows
hl.bind(main_mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(main_mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(main_mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(main_mod .. " + " .. i,          hl.dsp.focus({ workspace = i }))
    hl.bind(main_mod .. " + SHIFT + " .. i,  hl.dsp.window.move({ workspace = i }))
end
hl.bind(main_mod .. " + 0",          hl.dsp.focus({ workspace = 10 }))
hl.bind(main_mod .. " + SHIFT + 0",  hl.dsp.window.move({ workspace = 10 }))

-- Scroll workspaces with mouse wheel
hl.bind(main_mod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }), { mouse = true })
hl.bind(main_mod .. " + SHIFT + TAB",   hl.dsp.focus({ workspace = "e-1" }), { mouse = true })
