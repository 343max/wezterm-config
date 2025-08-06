local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "SpaceGray"
  else
    return "Atelier Heath Light (base16)"
  end
end

wezterm.on("window-config-reloaded", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
  
  -- Set background image only in dark mode
  if appearance:find("Dark") then
    overrides.window_background_image = '/Users/max/Raycast Wallpapers/bright-rain.png'
  else
    overrides.window_background_image = nil
  end
  window:set_config_overrides(overrides)
end)

return {
}
