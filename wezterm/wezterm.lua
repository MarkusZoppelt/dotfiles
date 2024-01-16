local wezterm = require 'wezterm'
local config = {
    hide_tab_bar_if_only_one_tab = true,
    native_macos_fullscreen_mode = false,
}

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'Monaspace Neon'
config.font_size = 16

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
