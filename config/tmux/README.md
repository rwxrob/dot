# TMUX Terminal Multiplexer Configuration

TMUX is the most powerful multiplexer on the planet. But one of the most
annoying things about it is that rather than choose backward-compatible
key bindings with screen they choose to do something entirely different.
I might understand why they did it, but I don't agree with it.
Therefore, the `tmux.conf` configuration file is designed with two top
priorities in mind:

1. 100% `screen` muscle memory
1. Vim-bindings for pane navigation and resizing

## Live Configuration

The `live.conf` file is for those who wish to replicate how I run one
TMUX session within another (TMUX-ception). This allows me to have
`WeeChat` running in the bottom parent pane and an entire additional TMUX
session in the lower pane. This allows me to create new windows and
panes freely without messing with the top of the computer screen
dedicated to chat (but requires using `tmuxin` when starting up a tmux
within a parent tmux, see below).

The live configuration also dedicates the entire status line to
information provided for the stream and not the current editing session.
Currently, that is a date and time and space for a [pomo] session. The
nested session has its own status line.

[pomo]: <https://github.com/rwxrob/cmdbox-pomo>

In order to avoid the troubles remembering what all the keystrokes are
for everything I only use the default `C-b` meta key for the *parent*
session and my normal `C-a` (same as `screen`) for the nested session.
Since I never really use remote TMUX sessions --- preferring instead to
quickly open up another local pane with a remote connection in it --- I
never regret not having `C-b` to handle the nested remote TMUX session
scenario.

## Use `tmuxin` to Enable TMUX-ception

Remember to `unset TMUX` to allow starting the nested TMUX session. To
make it easier [`tmuxin`](../scripts/tmuxin) can be used instead of
`tmux`.
