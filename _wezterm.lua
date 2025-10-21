local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Color
config.color_scheme = "nord"

-- Window
config.window_background_opacity = 0.8
config.colors = {
	tab_bar = {
			background = "none",
	},
}
config.window_background_gradient = {
	colors = {
			"#000033",
	}
}

-- Tab
config.use_fancy_tab_bar = false

-- Font
config.font = wezterm.font("UDEV Gothic", {weight="Medium", stretch="Normal", style="Normal"})  
config.font_size = 14

config.keys = {
	-- Swtich tab
	-- Same as in Chrome
    -- mac
    {key="LeftArrow", mods="CMD|OPT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="CMD|OPT", action=wezterm.action{ActivateTabRelative=1}},
}

-- Enable typing backslash on Mac
config.send_composed_key_when_left_alt_is_pressed = true

return config
