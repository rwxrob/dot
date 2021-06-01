# required for lynx and tmux colors to work correctly
export TERM=xterm-256color

export GITUSER="$USER"
export DOTFILES="$HOME/repos/github.com/$GITUSER/dot"

test -e /etc/bashrc && source /etc/bashrc

case $- in
*i*) ;;
*) return ;;
esac

pathappend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in
    *:${ARG}:*) continue ;;
    esac
    export PATH="${PATH:+"${PATH}:"}${ARG}"
  done
}

pathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in
    *:${ARG}:*) continue ;;
    esac
    export PATH="${ARG}${PATH:+":${PATH}"}"
  done
}

# override as needed in .bashrc_{personal,private,work}
# several utilities depend on SCRIPTS being in a github repo
export SCRIPTS=~/.local/bin/scripts
test ! -d "$SCRIPTS" && mkdir -p "$SCRIPTS"

pathprepend \
  "$SCRIPTS" \
  ~/.local/bin \
  /usr/local/go/bin

pathappend \
  /usr/local/opt/coreutils/libexec/gnubin \
  /mingw64/bin \
  /usr/local/tinygo/bin \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/games \
  /usr/sbin \
  /usr/bin \
  /snap/bin \
  /sbin \
  /bin

export CDPATH=.:\
~/repos/github.com:\
~/repos/github.com/$GITUSER:\
~/repos:\
/media/$USER:\
~

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s histappend
#shopt -s nullglob # bug kills completion for some

set -o vi
set -o noclobber

PROMPT_LONG=50
PROMPT_MAX=95

__ps1() {
  local P='$'

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

  if test "${EUID}" == 0; then
    P='#'
    if test -n "${ZSH_VERSION}"; then
      u='$F{red}'
    else
      u=$r
    fi
    p=$u
  fi

  local dir;
  if test "$PWD" = "$HOME"; then
    dir='~'
  else
    dir="${PWD##*/}"
    if test "${dir}" = _; then
      dir=${PWD#*${PWD%/*/_}}
      dir=${dir#/}
    elif test "${dir}" = work; then
      dir=${PWD#*${PWD%/*/work}}
      dir=${dir#/}
    fi
  fi

  local B=$(git branch --show-current 2>/dev/null)
  test "$dir" = "$B" && B='.'
  local countme="$USER@$(hostname):$dir($B)\$ "

  test "$B" = master -o "$B" = main && b=$r
  test -n "$B" && B="$g($b$B$g)"

  if test -n "${ZSH_VERSION}"; then
    local short="$u%n$g@$h%m$g:$w$dir$B$p$P$x "
    local long="$g╔ $u%n$g@%m\h$g:$w$dir$B\n$g╚ $p$P$x "
    local double="$g╔ $u%n$g@%m\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "
  else
    local short="$u\u$g@$h\h$g:$w$dir$B$p$P$x "
    local long="$g╔ $u\u$g@$h\h$g:$w$dir$B\n$g╚ $p$P$x "
    local double="$g╔ $u\u$g@$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "
  fi

  if test ${#countme} -gt "${PROMPT_MAX}"; then
    PS1="$double"
  elif test ${#countme} -gt "${PROMPT_LONG}"; then
    PS1="$long"
  else
    PS1="$short"
  fi
}

PROMPT_COMMAND="__ps1"

test -n "$DISPLAY" && setxkbmap -option caps:escape &>/dev/null

export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi

test -d ~/.vim/spell && export VIMSPELL=(~/.vim/spell/*.add)

export PYTHONDONTWRITEBYTECODE=1

clear() { printf "\e[H\e[2J"; } && export -f clear
c() { printf "\e[H\e[2J"; } && export -f c

if which dircolors &>/dev/null; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

owncomp=(pdf md yt gl kn auth pomo config sshkey ws ./build build ./setup)
for i in ${owncomp[@]}; do complete -C $i $i; done

type gh &>/dev/null && . <(gh completion -s bash)
type pandoc &>/dev/null && . <(pandoc --bash-completion)
type kubectl &>/dev/null && . <(kubectl completion bash)
type kind &>/dev/null && . <(kind completion bash)
type yq &>/dev/null && . <(yq shell-completion bash)

if test -x /usr/bin/lesspipe; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOPATH=~/.local/share/go
export GOBIN=~/.local/bin
export GOPROXY=direct
export CGO_ENABLED=0

unalias -a
alias d=docker
alias k=kubectl
alias grep='grep -i --colour=auto'
alias egrep='egrep -i --colour=auto'
alias fgrep='fgrep -i --colour=auto'
alias curl='curl -L'
alias ls='ls -h --color=auto'
alias '?'=duck
alias '??'=google
alias '???'=bing
alias x="exit"
alias sl="sl -e"
alias mkdirisosec='d=$(isosec);mkdir $d; cd $d'
alias main='cd $(work main)'
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias free='free -h'
alias df='df -h'
alias top=htop
alias chmox='chmod +x'
alias sshh='sshpass -f $HOME/.sshpass ssh '

which vim &>/dev/null && alias vi=vim

envx() {
  local envfile="$1"
  if test ! -e "$envfile" ; then
    if test ! -e ~/.env ; then
      echo "file not found: $envfile"
      return
    fi
    envfile=~/.env
  fi
  while IFS= read -r line; do
    name=${line%%=*}
    value=${line#*=}
    if [[ -z "${name}" || $name =~ ^# ]]; then
      continue
    fi
    export "$name"="$value"
  done <"${envfile}"
} && export -f envx

test -e ~/.env && envx ~/.env 

test -r ~/.bash_personal && source ~/.bash_personal
test -r ~/.bash_private && source ~/.bash_private
test -r ~/.bash_work && source ~/.bash_work
