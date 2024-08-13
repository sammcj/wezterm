local wezterm = require 'wezterm'

-- Import other modules
local appearance = require 'appearance'
local colours = require 'colours'
local projects = require 'projects'

-- Create config object
local config = wezterm.config_builder()

-- Apply configurations from other modules
appearance.apply(config)
colours.apply(config)
projects.apply(config)

-- Leader key configuration
config.leader = {
    key = 'a',
    mods = 'CTRL',
    timeout_milliseconds = 1000
}

-- Key bindings
config.keys = {{
    key = 'p',
    mods = 'LEADER',
    action = projects.choose_project()
}, {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs {
        flags = 'FUZZY|WORKSPACES'
    }
}, {
    key = "LeftArrow",
    mods = "SHIFT|SUPER",
    action = wezterm.action.ActivateTabRelative(-1)
}, {
    key = "RightArrow",
    mods = "SHIFT|SUPER",
    action = wezterm.action.ActivateTabRelative(1)
}}

-- macOS specific key bindings
if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
    table.insert(config.keys, {
        key = "LeftArrow",
        mods = "CMD|SHIFT",
        action = wezterm.action.ActivateTabRelative(-1)
    })
    table.insert(config.keys, {
        key = "RightArrow",
        mods = "CMD|SHIFT",
        action = wezterm.action.ActivateTabRelative(1)
    })
end

return config
