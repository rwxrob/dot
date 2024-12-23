local wezterm = require("wezterm")
return {
  window_close_confirmation = 'NeverPrompt',
  default_prog = {'/opt/homebrew/bin/bash','--login'},
  color_scheme = 'Gruvbox Material (Gogh)',
  font = wezterm.font('UbuntuMono Nerd Font'),
  font_size = 34,
  colors = {
    cursor_bg = '#928374',
    cursor_border = '#928374',
  },
  term = "xterm-256color",
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
}





