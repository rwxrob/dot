# Alacritty OpenGL Accelerated Terminal

Fastest terminal currently invented by humans (and a great example of what Rust can do when applied to its perfect use case). One of Alacritty's greatest advantages is that it can be set to poll its own configuration file for changes. This allows all sorts of creative ways to dynamically change the default configuration. However, when doing so the file changes so often that symbolically linking it from this configuration repo would cause frequent unnecessary commits. Therefore, in this case the `setup` script simply makes a copy into `~/.config/alacritty/alacritty.yml` instead, which is automatically detected with `alacritty` is run.

***WARNING: Changes to `~/.config/alacritty/alacritty.yml` will not be preserved.***

## Fullscreen

This configuration is set to automatically start all `alacritty` terminals in fullscreen mode.
