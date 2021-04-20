
# Adaptive prompt that will be shortened if there is room. Set the
# following to your preferred threshold.

LONG_PROMPT=30

__ps1 () {

  # set shortcuts for all the colors
  local g='\[\e[38;2;110;110;110m\]'
  local h='\[\e[34m\]'
  local u='\[\e[33m\]'
  local P='$'
  local p='\[\e[33m'
  local w='\[\e[35m\]'
  local x='\[\e[0m\]'

  # watch out, you're root
  if test "${EUID}" == 0; then
    P='#'
    u='\[\e[38;2;255;0;0m\]'
    p=$u
  fi

  # let's see how long this thing really is
  local countme="$USER@$(hostname):$(basename $PWD)$(__git_ps1 '(%s)')$ "

  local short="$u\u$g@$h\h$g:$w\W$g\$(__git_ps1 '(%s)')$p$P$x "
  local long="$g╔═$u\u$g@$h\h$g:$w\W$g\$(__git_ps1 '(%s)')\n$g╚═$p$P$x "

  if test ${#countme} -gt "${LONG_PROMPT}"  ;  then
    PS1="${long}"
  else
    PS1="${short}"
  fi
}

PROMPT_COMMAND="${PROMPT_COMMAND:+PROMPT_COMMAND;}__ps1;"

