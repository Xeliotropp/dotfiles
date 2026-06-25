hl.config({
    decoration = {
        blur = {
            enabled = true,
            size = 3,
            passes = 2,
        },
        rounding=8,
    },
    animations = {
        enabled = true,
        hl.curve("overshoot", { type = "bezier", points = { {0.3, 0.5}, {0.1, 1.1} } }),
        hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "overshoot", style = "slide" }),
        hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "overshoot" }),
    }
})

-- Dynamic borders
hl.window_rule({
    name = "dynamic-borders",
    border_size = 0,
    match = {
        float = 0,
        workspace = "w[tv1]s[false]"
    }
})
-- Removes the border on floating windows
hl.window_rule({
    border_size = 0,
    match = {
        float = true
    }
})

hl.window_rule({
    name = "browser-ws2",
    match = { class = "^(firefox)$"},
    workspace = "2"
})

hl.window_rule({
    name = "discord",
    match = {class = "^(discord)$"},
    workspace = "3"
})
hl.window_rule({
    name = "steam",
    match = {class = "^(steam)$"},
    workspace = "5"
})
hl.window_rule({
    name = "steam",
    match = {class = "^(steam)$"},
    workspace = "3"
})


hl.window_rule({
    name = "chromium-pinned-pip-mode",
    match = {title = "Picture in picture"},
    float = true,
    pin = true,
    max_size = {952, 542}
})

hl.window_rule({
    name = "firefox-pinned-pip-mode",
    match = {class="firefox", title = "Picture-in-Picture"},
    float = true,
    pin = true,
    max_size = {952, 542}
})
