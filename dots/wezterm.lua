local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Dracula (Gogh)'
config.font = wezterm.font 'Berkeley Mono'

config.keys = {
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
}

return config
