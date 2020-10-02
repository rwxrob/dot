
#set -o noclobber            # paranoid? use >| for everything
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s nullglob
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

export HRULEWIDTH=73

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
