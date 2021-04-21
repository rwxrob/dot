
# Adaptive prompt that will be shortened if there is room. Set the
# following to your preferred threshold.

PROMPT_LONG=30
PROMPT_MAX=79


__ps1 () {

  local P='$' # changes to hashtag when root

	# set shortcuts for all the colors
  if test -n "${ZSH_VERSION}"; then
    local r='%F{red}'
    local g='%F{black}'
    local h='%F{blue}'
    local u='%F{yellow}'
    local p='%F{yellow}'
    local w='%F{magenta}'
    local b='%F{cyan}'
    local x='%f'
  else
		local r='\[\e[31m\]'
		local g='\[\e[30m\]'
		local h='\[\e[34m\]'
		local u='\[\e[33m\]'
		local p='\[\e[33m\]'
		local w='\[\e[35m\]'
		local b='\[\e[36m\]'
		local x='\[\e[0m\]'
  fi

  # watch out, you're root
  if test "${EUID}" == 0; then
    P='#'
    if test -n "${ZSH_VERSION}"; then
      u='$F{red}'
    else
      u=$r
    fi
    p=$u
  fi

  # git branch with warning about main or master
  local B=$(git branch --show-current 2>/dev/null)
  local _B="${B}"
  test "${B}" = master -o "${B}" = main && b=$r
  test -n "${B}" && B="$g($b$B$g)"

  # let's see how long this thing really is
  local countme="$USER@$(hostname):$(basename $PWD)($_B)\$ "

  if test -n "${ZSH_VERSION}"; then
    local short="$u%n$g@$h%m$g:$w%1~$B$p$P$x "
    local long="$g╔ $u%n$g@%m\h$g:$w%1~$B\n$g╚ $p$P$x "
    local double="$g╔ $u%n$g@%m\h$g:$w%1~\n$g║ $B\n$g╚ $p$P$x "
  else
    local short="$u\u$g@$h\h$g:$w\W$B$p$P$x "
    local long="$g╔ $u\u$g@$h\h$g:$w\W$B\n$g╚ $p$P$x "
    local double="$g╔ $u\u$g@$h\h$g:$w\W\n$g║ $B\n$g╚ $p$P$x "
  fi

  if test ${#countme} -gt "${PROMPT_MAX}"  ;  then
    PS1="${double}"
  elif test ${#countme} -gt "${PROMPT_LONG}"  ;  then
    PS1="${long}"
  else
    PS1="${short}"
  fi
}

PROMPT_COMMAND="${PROMPT_COMMAND:+PROMPT_COMMAND;}__ps1;"

