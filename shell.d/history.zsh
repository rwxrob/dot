
# vi or die
set -o vi

export HISTFILESIZE=
export HISTSIZE=
export HISTFILE=~/.zsh_history 
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Uncomment to enable immediate history updates for all windows/panes
# PROMPT_COMMAND="${PROMPT_COMMAND:+PROMPT_COMMAND;}history -a; history -c; history -r;"
