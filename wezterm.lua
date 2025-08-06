local wezterm = require 'wezterm'

require 'scheme_for_appearance'

wezterm.on('user-var-changed', function(window, pane, name, value)
  wezterm.log_info('var', name, value)
  if name == 'open_url' then
    wezterm.open_with(value)
  end
end)

local config = wezterm.config_builder()

config.exit_behavior = 'CloseOnCleanExit'

config.color_scheme = 'SpaceGray'
-- config.color_scheme = 'AtelierSulphurpool'

config.keys = {
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = 'h',
    mods = 'CMD|ALT',
    action = wezterm.action.SpawnCommandInNewTab {
      args = {'osascript', '-e', 'tell application "System Events" to set visible of every process whose frontmost is false to false'},
    },
  }
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.audible_bell = "Disabled"

config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 90,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 90,
}

config.colors = {
  visual_bell = '#999',
  scrollbar_thumb = '#666',
}

config.use_fancy_tab_bar = true

config.enable_scroll_bar = true

-- Background image will be set conditionally based on appearance

-- config.window_background_opacity = 0.7
-- config.macos_window_background_blur = 50

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

return config
