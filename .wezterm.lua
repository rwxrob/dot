local wezterm = require("wezterm")
return {
  window_close_confirmation = 'NeverPrompt',
  default_prog = {'/opt/homebrew/bin/bash','--login'},
  color_scheme = 'Gruvbox Material (Gogh)',
  font = wezterm.font('UbuntuMono Nerd Font'),
  font_size = 35,
  colors = {
    cursor_bg = '#928374',
    cursor_border = '#928374',
  },

  window_padding = {
   left = 40,
   right = 0,
   top = 0,
   bottom = 2,
  },

  term = "xterm-256color",

  ----------- rwxrob streaming stuff, fyi --------------

  --font_size = 41,
  --initial_cols = 74,
  --initial_rows = 22,

  --[[
  -- exactly position
  wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():set_position(0, 130)
end),
  ]]--

  --window_decorations = "RESIZE",
  --enable_tab_bar = false,
  --hide_tab_bar_if_only_one_tab = true,

}





