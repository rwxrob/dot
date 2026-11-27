local wezterm = require 'wezterm'
local is_mac = wezterm.target_triple:find('darwin') ~= nil
local is_windows = wezterm.target_triple:find('windows') ~= nil

-- open the first window where I like it: filling the laptop screen below the
-- main display (pixel offsets from the main screen)
if is_mac then
  wezterm.on('gui-startup', function(cmd)
    local args = cmd or {}
    args.position = args.position or {
      x = 420,
      y = 2282,
      origin = 'MainScreen',
    }
    wezterm.mux.spawn_window(args)
  end)
end

local config = {
  audible_bell = "Disabled",
  window_close_confirmation = 'NeverPrompt',
  color_scheme = 'Gruvbox Material (Gogh)',
  font = wezterm.font_with_fallback({
    'UbuntuMono Nerd Font',
    'UbuntuMono Nerd Font Mono',
    'UbuntuMono NF',
    'Ubuntu Mono',
    'Menlo',
  }),
  font_size = 37,
  initial_cols = 80,
  initial_rows = 24,
send_composed_key_when_left_alt_is_pressed = true,
send_composed_key_when_right_alt_is_pressed = true,
  colors = {
    cursor_bg = '#928374',
    cursor_border = '#928374',
  },
  term = "xterm-256color",
--  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
   left = 10,
   right = 0,
   top = 0,
   bottom = 10,
  },
}

if is_mac then
  config.default_prog = {'/opt/homebrew/bin/bash', '--login'}
elseif is_windows then
  -- bash in the default WSL distribution, starting in its home directory
  config.default_prog = {'wsl.exe', '--cd', '~', '--exec', 'bash', '--login'}
end

return config
