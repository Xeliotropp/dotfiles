require("mocha")
require("window_rules")
require("keybinds")
require("programs")
require("input")
require("monitors")
require("variables")

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("flameshot")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dunst")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
end)

hl.config({
    general = {
        border_size = 1,
        col = {
            active_border   = { colors = { mocha.green } },
            inactive_border = mocha.subtext0,
        },
        resize_on_border = true,
        gaps_in  = 4,
        gaps_out = 4,
        layout   = "dwindle",
        allow_tearing = false,
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})
