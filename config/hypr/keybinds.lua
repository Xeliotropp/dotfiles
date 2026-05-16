local mainMod = "SUPER"

require("programs")
-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media / brightness keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh volume_up"),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh volume_down"),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh volume_mute"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh mic_mute"),        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh brightness_up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/dunst/volume_brightness.sh brightness_down"), { locked = true, repeating = true })

-- Apps
hl.bind(mainMod .. " + Return",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd(browser))

-- Window management
hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind("CTRL + ALT + Delete",     hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + W",         hl.dsp.group.toggle())

-- Launcher / tools
hl.bind(mainMod .. " + Space",       hl.dsp.exec_cmd(menu))
hl.bind("CTRL + ALT + Escape",       hl.dsp.exec_cmd("hyprlock"))
hl.bind("CTRL + SHIFT + Escape",     hl.dsp.exec_cmd("kitty btop"))
hl.bind(mainMod .. " + SHIFT + W",   hl.dsp.exec_cmd("~/.config/scripts/hyprpaper.sh"))
hl.bind(mainMod .. " + SHIFT + R",   hl.dsp.exec_cmd("hyprctl reload && pkill waybar || true; hyprctl dispatch exec waybar"))
hl.bind(mainMod .. " + SHIFT + S",   hl.dsp.exec_cmd("flameshot gui"))
hl.bind(mainMod .. " + V",           hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

-- Focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,          hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,  hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0",          hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0",  hl.dsp.window.move({ workspace = 10 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + P",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces with mouse wheel
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { mouse = true })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { mouse = true })
