local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Color
config.color_scheme = "nord"
config.window_background_opacity = 0.8

-- Font
config.font = wezterm.font("UDEV Gothic", {weight="Medium", stretch="Normal", style="Normal"})  
config.font_size = 14
  
return config
