local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Preserve the key bindings from the repository
config.keys = {
    {
        key = 'f',
        mods = 'CTRL',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = '\'',
        mods = 'CTRL',
        action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    },
}

-- Preserve the mouse bindings from the repository
config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

return config 