#!/bin/bash

export PS1u=$'\033[33m'
export PS1a=$'\033[38;2;100;100;100m'
export PS1h=$'\033[34m'
export PS1p=$PS1u
export PS1P=$'\033[31m'
export PS1U=$PS1P

__ps1 () {
  local g='\[\e[38;2;110;110;110m\]'
  local h='\[\e[34m\]'
  local u='\[\e[33m\]'
  local P='$'
  local p='\[\e[33m'
  local w='\[\e[35m\]'
  local x='\[\e[0m\]'
  local countme="$USER@$(hostname):$(basename $PWD)$(__git_ps1 '(%s)')$ "
  local short="$u\u$g@$h\h$g:$w\W$g\$(__git_ps1 '(%s)')$p$P$x "
  local long="$g╔═$u\u$g@$h\h$g:$w\W$g\$(__git_ps1 '(%s)')\n$g╚═$p$P$x "
  if test ${#countme} -gt 30;  then
    PS1="${long}"
  else
    PS1="${short}"
  fi
}

PROMPT_COMMAND="__ps1"

if [[ $EUID == 0 ]]; then
  export PS1='\[${PS1P}\]\u\[${PS1c}\]@\[${PS1h}\]\h\[${PS1c}\]:\[${PS1w}\]\W$(__git_ps1 "\[${PS1c}\](\[${gruv_purple}\]%s\[${PS1c}\])")\[$PS1P\]#\[\033[00m\] '
else
  export PS1='$(__ps1)'
  #export PS1='\[${PS1u}\]\u\[${PS1c}\]@\[${PS1h}\]\h\[${PS1c}\]:\[${PS1w}\]\W$(__git_ps1 "\[${PS1c}\](\[${gruv_purple}\]%s\[${PS1c}\])")\[$PS1p\]$\[\033[00m\] '
fi

