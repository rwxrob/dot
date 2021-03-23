#!/usr/bin/bash
source "$HOME/.shell.d/detection.sh"
source "$HOME/.shell.d/git.sh"
source "$HOME/.shell.d/git-prompt.sh"
source "$HOME/.shell.d/path.sh"
source "$HOME/.shell.d/history.bash"
source "$HOME/.shell.d/pager.sh"
source "$HOME/.shell.d/settings.bash"
source "$HOME/.shell.d/prompt.bash"
source "$HOME/.shell.d/editor.sh"
source "$HOME/.shell.d/python.sh"
source "$HOME/.shell.d/dircolors.sh"
source "$HOME/.shell.d/completion.bash"
source "$HOME/.shell.d/colors.sh"
source "$HOME/.shell.d/termcap-colors.sh"
source "$HOME/.shell.d/golang.sh"
source "$HOME/.shell.d/aliases.sh"
source "$HOME/.shell.d/envx.bash"
[ -r ~/.bash_private   ] && source ~/.bash_private

# set the default prompt
ps1min
