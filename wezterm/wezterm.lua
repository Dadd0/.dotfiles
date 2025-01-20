local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  default_cursor_style = "SteadyBar",
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE|TITLE",
  check_for_updates = false,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  font_size = 13,
  font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
  enable_tab_bar = false,
  window_padding = {
    left = 3,
    right = 3,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 0.8,
  background = {
  {
    source = {
      File = "C:\\Users\\eddyc\\Pictures\\planets.jpg"
    },
    hsb = {
      saturation = 1.0,
      brightness = 0.15,
    },
    width = "100%",
    height = "100%",
    opacity = 0.95,
    horizontal_align = "Right",  -- Aligns to the right
    vertical_align = "Top"      -- Keeps vertical alignment at top
    }
  }
}

config.default_cwd = "/home/edoardo"

config.wsl_domains = {
  {
    name = 'WSL:Ubuntu',
    distribution = 'Ubuntu'
  }
}

config.default_domain = 'WSL:Ubuntu'

-- Terminal Size
config.initial_rows = 33
config.initial_cols = 130

--config.leader = { key = 'a', mods = "CTRL", timeout_milliseconds = 1000}
config.keys = {
{
  mods = '',
  key = 'F11',
  action = wezterm.action.ToggleFullScreen,
},
--  {
--    mods = "LEADER",
--    key = 'v',
--    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
--  }, 
--  {
--    mods = "LEADER",
--    key = 'h',
--    action = wezterm.action.SplitHorizontal {domain = "CurrentPaneDomain"}
--  },
}

return config

