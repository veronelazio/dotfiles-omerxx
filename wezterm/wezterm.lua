local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- Font configuration
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

-- Window appearance
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Catppuccin Mocha colors
config.colors = {
    foreground = "#CDD6F4",
    background = "#1E1E2E",
    cursor_bg = "#F5E0DC",
    cursor_border = "#F5E0DC",
    cursor_fg = "#1E1E2E",
    selection_bg = "#585B70",
    selection_fg = "#CDD6F4",
    ansi = {
        "#45475A", -- black
        "#F38BA8", -- red
        "#A6E3A1", -- green
        "#F9E2AF", -- yellow
        "#89B4FA", -- blue
        "#F5C2E7", -- magenta
        "#94E2D5", -- cyan
        "#BAC2DE", -- white
    },
    brights = {
        "#585B70", -- bright black
        "#F38BA8", -- bright red
        "#A6E3A1", -- bright green
        "#F9E2AF", -- bright yellow
        "#89B4FA", -- bright blue
        "#F5C2E7", -- bright magenta
        "#94E2D5", -- bright cyan
        "#A6ADC8", -- bright white
    },
}

-- Basic key bindings (minimal since we're using tmux)
config.keys = {
    {
        key = 'f',
        mods = 'CTRL',
        action = wezterm.action.ToggleFullScreen,
    },
}

-- Mouse bindings
config.mouse_bindings = {
    -- Ctrl-click will open links
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Right click paste
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action.PasteFrom 'Clipboard',
    },
}

-- Terminal Features
config.scrollback_lines = 10000
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Linear'
config.cursor_blink_ease_out = 'Linear'

return config
