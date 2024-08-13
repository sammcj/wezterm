local wezterm = require 'wezterm'
local colours = require 'colours'

local M = {}

function M.apply(config)
    -- Fonts
    config.font = wezterm.font_with_fallback({"BerkeleyMono Nerd Font Mono"})
    config.font_size = 17.0

    -- Window appearance
    config.enable_scroll_bar = true
    config.window_background_opacity = 0.9
    config.macos_window_background_blur = 30
    config.window_decorations = 'RESIZE'
    config.window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
    }

    -- Tab bar
    config.use_fancy_tab_bar = true
    config.tab_bar_at_bottom = true
    config.tab_max_width = 24

    -- Status bar
    config.status_update_interval = 1000

    -- Tab title formatting
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local title = tab.active_pane.title
        local last_slash_pos = title:match(".*/()")
        if last_slash_pos then
            title = title:sub(last_slash_pos)
        end
        title = wezterm.truncate_right(title, max_width - 3)
        return {{
            Text = string.format(" %d ", tab.tab_index + 1)
        }, {
            Text = title
        }, {
            Text = " "
        }}
    end)

    -- Status bar updating
    wezterm.on("update-status", function(window, pane)
        local date = wezterm.strftime("%Y-%m-%d %H:%M")
        local bat = ""
        for _, b in ipairs(wezterm.battery_info()) do
            bat = string.format("%.0f%%", b.state_of_charge * 100)
        end
        window:set_right_status(wezterm.format({{
            Text = bat .. "  " .. date .. " "
        }}))
    end)

    -- Startup behavior
    wezterm.on("gui-startup", function()
        local tab, pane, window = wezterm.mux.spawn_window({})
-- make the window positioned in the bottom left of the main display
window:set_position(wezterm.rect {
    x = 0,
    y = 0,
    width = 0.5,
    height = 0.5
})

    end)
end

return M
