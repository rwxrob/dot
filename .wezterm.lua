local wezterm = require("wezterm")

return {

  font_size = 36,
  font = wezterm.font("UbuntuMono Nerd Font"),

  window_padding = {
   left = 0,
   right = 0,
   top = 0,
   bottom = 0,
  },

  term = "xterm-256color",
  animation_fps = 60,
  max_fps = 60,
  window_decorations = "RESIZE",

  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  colors = {
     foreground = "#d4be98", -- Default text color
     cursor_bg  = "#d4be98", -- Default text color
     cursor_border = "#d4be98", -- Default text color
     background = "#282828", -- Background color
     selection_bg = "#45403d" ,

    ansi = {
      "#282828", -- Black (Normal)
      "#cc241d", -- Red (Normal)
      "#98971a", -- Green (Normal)
      "#d79921", -- Yellow (Normal)
      "#458588", -- Blue (Normal)
      "#b16286", -- Magenta (Normal)
      "#689d6a", -- Cyan (Normal)
      "#a89984", -- White (Normal)
    },
    brights = {
      "#928374", -- Bright Black
      "#fb4934", -- Bright Red
      "#b8bb26", -- Bright Green
      "#fabd2f", -- Bright Yellow
      "#83a598", -- Bright Blue
      "#d3869b", -- Bright Magenta
      "#8ec07c", -- Bright Cyan
      "#ebdbb2", -- Bright White
    }
  }

}