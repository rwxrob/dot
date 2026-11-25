# TMUX terminal multiplexer configuration

TMUX is the most powerful multiplexer on the planet. But one of the most
annoying things about it is that rather than choose backward-compatible
key bindings with screen they choose to do something entirely different.
I might understand why they did it, but I don't agree with it.
Therefore, the `tmux.conf` configuration file is designed with two top
priorities in mind:

1. 100% `screen` muscle memory
1. Vim-bindings for pane navigation and resizing

## Use `tmuxin` to enable TMUX-ception

[`tmuxin`](../../bin/tmuxin) starts a TMUX session nested inside another
one. It unsets `TMUX` first, which TMUX otherwise refuses to nest.
