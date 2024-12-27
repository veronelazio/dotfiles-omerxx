local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Color scheme and appearance
config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.font_size = 16.0
config.font = wezterm.font('MesloLGS Nerd Font Mono')  -- Changed to Nerd Font for better icons
config.macos_window_background_blur = 30
config.window_background_opacity = 1.0
config.window_decorations = 'RESIZE'

-- Key bindings
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

-- Mouse bindings
config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

-- Return the configuration
return config
