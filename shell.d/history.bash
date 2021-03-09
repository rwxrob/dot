
# vi or die
set -o vi

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

# Uncomment to enable immediate history updates for all windows/panes
# PROMPT_COMMAND="${PROMPT_COMMAND:+PROMPT_COMMAND;}history -a; history -c; history -r;"
