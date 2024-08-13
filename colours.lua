local wezterm = require 'wezterm'

local M = {}

-- Define your color schemes here
local lavi = {
    foreground = "#FFF1E0",
    background = "#252137",
    cursor_bg = "#FFFFFF",
    cursor_fg = "#252137",
    cursor_border = "#FFFFFF",
    selection_bg = "#FFFFFF",
    selection_fg = "#000000",
    ansi = {"#2F2A38", "#FF87A5", "#6EEB84", "#FFD080", "#80BDFF", "#B891FF", "#3FC4C4", "#EEE6FF"},
    brights = {"#8977A8", "#F2637E", "#AFFF61", "#FFDF61", "#7583FF", "#B98AFF", "#2BEDC0", "#FFFFFF"},
    tab_bar = {
        background = "#252137"
    },
    visual_bell = "#252137",
    indexed = {
        [16] = "#CEB999",
        [17] = "#a6875a",
        [18] = "#3b290e",
        [19] = "#483270",
        [20] = "#A872FB",
        [21] = "#B29EED",
        [22] = "#7F7DEE",
        [23] = "#fb72fa",
        [24] = "#EBBBF9",
        [25] = "#EAC6F5",
        [26] = "#EAD2F1",
        [27] = "#ffe4e1",
        [28] = "#3C2C74",
        [29] = "#9fdfb4",
        [30] = "#e4fffe",
        [31] = "#a4e2e0",
        [32] = "#a2e0ca",
        [33] = "#f0f070",
        [34] = "#FF7D90",
        [35] = "#e86f54",
        [36] = "#ff9969",
        [37] = "#b32e29",
        [38] = "#222222",
        [39] = "#777777",
        [40] = "#aaaaaa",
        [41] = "#cccccc",
        [42] = "#dddddd",
        [43] = "#6E6EA3",
        [44] = "#38265A",
        [45] = "#252137",
        [46] = "#564D82",
        [47] = "#8F8FB3",
        [48] = "#EAD6FF"
    }
}

M.color_schemes = {
    lavi = lavi
}

function M.apply(config)
    config.color_scheme = "lavi"
    config.colors = M.color_schemes.lavi
end

return M
