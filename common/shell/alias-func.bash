
############################## All Aliases ##############################

# Keep in mind that aliases *cannot* be used from anything but the
# currently active shell (not subprocesses or any system exec() calls).
# Generally exported functions should be used instead (as recommended by
# the bash man page). Every alias you add is one additional thing that
# won't work on a remote system you don't own or haven't customized.
# Better to memorize the switch of commands so your fingers know what to
# do on *any* system. (Also the reason to learn vi over emacs.)

unalias -a

alias grep='grep -i --colour=auto'
alias egrep='egrep -i --colour=auto'
alias fgrep='fgrep -i --colour=auto'
alias curl='curl -L'
alias ls='ls -h --color=auto'
alias ssh-keygen="ssh-keygen -t ed25519"
alias '?'=duck
alias '??'=google
alias '???'=bing
alias x="exit"
alias sl="sl -e"

alias free='free -h'
alias df='df -h'
alias top="htop"

which vim &>/dev/null && alias vi=vim

envx () {
  local envfile="$1"
  if [[ ! -e "${envfile}" ]]; then
    if [[ ! -e "$HOME/.env" ]]; then
      echo "file not found: ${envfile}"
      return
    fi
    envfile="$HOME/.env"
  fi
  while IFS= read line; do
    name=${line%%=*}
    value=${line#*=}
    if [[ -z "${name}" || $name =~ ^# ]]; then
      continue
    fi
    export "$name"="$value"
  done < "${envfile}"
} && export -f envx

if [[ -e "$HOME/.env" ]]; then
  envx $HOME/.env
fi
