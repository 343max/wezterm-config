local wezterm = require 'wezterm'

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
}

config.use_fancy_tab_bar = true

return config
