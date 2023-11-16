local wezterm = require 'wezterm'
local config = {
    hide_tab_bar_if_only_one_tab = true,
}

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'Monaspace Neon'
config.font_size = 16

return config
