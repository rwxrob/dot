#!/bin/bash
# shellcheck disable=SC1090,SC1091

case $- in
*i*) ;; # interactive
*) return ;;
esac

# ------------------------- distro detection -------------------------

export DISTRO
[[ $(uname -r) =~ Microsoft ]] && DISTRO=WSL2 #TODO distinguish WSL1
#TODO add the rest

# ---------------------- local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------
#                           (also see envx)

export LANG=en_US.UTF-8 # assuming apt install language-pack-en done
export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export FTP=242
export WEIGHT=83.7
export HEIGHT=174
export TZ=America/New_York
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SNIPPETS="$DOTFILES/snippets"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/Templates"
export SCRIPTS="$HOME/Scripts"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Movies"
export PDFS="$HOME/usb/pdfs"
export VIRTUALMACHINES="$HOME/VirtualMachines"
export WORKSPACES="$HOME/Workspaces" # container home dirs for mounting
export ZETDIR="$GHREPOS/zet"
export ZETTELCASTS="$VIDEOS/ZettelCasts"
export CLIP_DIR="$VIDEOS/clips"
export CLIP_DATA="$GHREPOS/clip/data"
export CLIP_VOLUME=0
export CLIP_SCREEN=0
export TERM=xterm-256color
export CLICOLOR=1
export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
#export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
export PYTHONDONTWRITEBYTECODE=2
export LC_COLLATE=C
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

export LESS="-FXR"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me=""      # "0m"
export LESS_TERMCAP_se=""      # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue=""      # "0m"
export LESS_TERMCAP_us="[4m"  # underline

export ANSIBLE_CONFIG="$HOME/.config/ansible/config.ini"
export ANSIBLE_INVENTORY="$HOME/.config/ansible/inventory.yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
#export ANSIBLE_STDOUT_CALLBACK=json

export K8SAPP_CLUSTER=dev

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# ----------------------------- PostgreSQL ----------------------------

export PGPASS=~/.pgpass
# export PGHOST=localhost
# export PGUSER=myuser
# export PGDATABASE=mydatabase

# -------------------------------- gpg -------------------------------

GPG_TTY=$(tty)
export GPG_TTY

# ------------------------------- pager ------------------------------

if [[ -x /usr/bin/lesspipe ]]; then
	export LESSOPEN="| /usr/bin/lesspipe %s"
	export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
	if [[ -r "$HOME/.dircolors" ]]; then
		eval "$(dircolors -b "$HOME/.dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# ------------------------------- path -------------------------------

pathappend() {
	declare arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# remember last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$HOME/.local/go/bin" \
	"$HOME/.nimble/bin" \
	"$GHREPOS/cmd-"* \
	/usr/local/go/bin \
	/usr/local/opt/openjdk/bin \
	/usr/local/bin \
	/opt/homebrew/bin \
	"$SCRIPTS"

pathappend \
	/usr/local/opt/coreutils/libexec/gnubin \
	'/mnt/c/Windows' \
	'/mnt/c/Program Files (x86)/VMware/VMware Workstation' \
	/mingw64/bin \
	/usr/local/bin \
	/usr/local/sbin \
	/usr/local/games \
	/usr/games \
	/usr/sbin \
	/usr/bin \
	/snap/bin \
	/sbin \
	/bin

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$GHREPOS:$DOTFILES:$REPOS:/media/$USER:$HOME"

# ------------------------ bash shell options ------------------------

# shopt is for BASHOPTS, set is for SHELLOPTS

shopt -s checkwinsize # enables $COLUMNS and $ROWS
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

#shopt -s nullglob # bug kills completion for some
#set -o noclobber

# -------------------------- stty annoyances -------------------------

#stty stop undef # disable control-s accidental terminal stops
stty -ixon # disable control-s/control-q tty flow control

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚ $p$P$x "
	double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi
}

PROMPT_COMMAND="__ps1"

# ----------------------------- keyboard -----------------------------

# only works if you have X and are using graphic Linux desktop

_have setxkbmap && test -n "$DISPLAY" &&
	setxkbmap -option caps:escape &>/dev/null

# ------------------------------ aliases -----------------------------
#      (use exec scripts instead, which work from vim and subprocs)

unalias -a
alias todo='vi ~/.todo'
alias ip='ip -c'
alias '?'=duck
alias '??'=gpt
alias '???'=google
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias snippets='cd $SNIPPETS'
alias ls='ls -h --color=auto'
alias free='free -h'
alias tree='tree -a'
alias df='df -h'
alias chmox='chmod +x'
alias diff='diff --color'
alias sshh='sshpass -f $HOME/.sshpass ssh '
alias temp='cd $(mktemp -d)'
alias view='vi -R' # which is usually linked to vim
alias clear='printf "\e[H\e[2J"'
alias c='printf "\e[H\e[2J"'
alias coin="clip '(yes|no)'"
alias iam=live
alias neo="neo -D -c gold"
alias more="less"
alias disclaimer="clear; now; zet view disclaimer"
alias main="obs scene Main"
alias tight="obs scene Closeup"
alias pixel="scrcpy -t -s 1A141FDF600AJ4"

_have vim && alias vi=vim

# ----------------------------- functions ----------------------------

# lesscoloroff() {
#   while IFS= read -r line; do
#     unset ${line%%=*}
#   done < <(env | grep LESS_TERM)
# } && export -f lesscoloroff

envx() {
	local envfile="${1:-"$HOME/.env"}"
	[[ ! -e "$envfile" ]] && echo "$envfile not found" && return 1
	while IFS= read -r line; do
		name=${line%%=*}
		value=${line#*=}
		[[ -z "${name}" || $name =~ ^# ]] && continue
		export "$name"="$value"
	done <"$envfile"
} && export -f envx

[[ -e "$HOME/.env" ]] && envx "$HOME/.env"

new-from() {
	local template="$1"
	local name="$2"
	! _have gh && echo "gh command not found" && return 1
	[[ -z "$name" ]] && echo "usage: $0 <name>" && return 1
	[[ -z "$GHREPOS" ]] && echo "GHREPOS not set" && return 1
	[[ ! -d "$GHREPOS" ]] && echo "Not found: $GHREPOS" && return 1
	cd "$GHREPOS" || return 1
	[[ -e "$name" ]] && echo "exists: $name" && return 1
	gh repo create -p "$template" --public "$name"
	gh repo clone "$name"
	cd "$name" || return 1
}

new-bonzai() { new-from rwxrob/bonzai-example "$1"; }
new-cmd() { new-from rwxrob/template-bash-command "cmd-$1"; }
cdz() { cd "$(zet get "$@")" || exit; }

export -f new-from new-bonzai new-cmd

clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
		[[ -z "$user" ]] && user="$USER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

# ------------- source external dependencies / completion ------------

# for mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew_prefix="$(brew --prefix)"
	[[ -r "$brew_prefix/etc/profile.d/bash_completion.sh" ]] && . "$brew_prefix/etc/profile.d/bash_completion.sh"
fi

owncomp=(
	pdf zet keg kn yt gl auth pomo config live iam sshkey ws x clip
	./build build b ./k8sapp k8sapp ./setup ./cmd run ./run
	foo ./foo cmds ./cmds z bonzai openapi obs
)

for i in "${owncomp[@]}"; do complete -C "$i" "$i"; done

_have gh && . <(gh completion -s bash)
_have z && . <(z completion bash)
_have glow && . <(glow completion  bash)
_have goreleaser && . <(goreleaser completion bash 2>/dev/null)
_have klogin && . <(klogin completion bash 2>/dev/null)
_have pandoc && . <(pandoc --bash-completion)
_have kubectl && . <(kubectl completion bash 2>/dev/null)
_have kubeadm && . <(kubeadm completion bash 2>/dev/null)
_have k && complete -o default -F __start_kubectl k
_have istioctl && . <(istioctl completion bash 2>/dev/null)
#_have clusterctl && . <(clusterctl completion bash)
_have kind && . <(kind completion bash)
_have cobra && . <(cobra completion bash)
_have kompose && . <(kompose completion bash)
_have helm && . <(helm completion bash)
_have minikube && . <(minikube completion bash)
_have conftest && . <(conftest completion bash)
_have yq && . <(yq completion bash)
_have kt && . <(kt completion bash)
_have mk && complete -o default -F __start_minikube mk
_have podman && _source_if "$HOME/.local/share/podman/completion" # d
_have docker && _source_if "$HOME/.local/share/docker/completion" # d
_have docker-compose && complete -F _docker_compose dc            # dc

_have ansible && . <(register-python-argcomplete3 ansible)
_have ansible-config && . <(register-python-argcomplete3 ansible-config)
_have ansible-console && . <(register-python-argcomplete3 ansible-console)
_have ansible-doc && . <(register-python-argcomplete3 ansible-doc)
_have ansible-galaxy && . <(register-python-argcomplete3 ansible-galaxy)
_have ansible-inventory && . <(register-python-argcomplete3 ansible-inventory)
_have ansible-playbook && . <(register-python-argcomplete3 ansible-playbook)
_have ansible-pull && . <(register-python-argcomplete3 ansible-pull)
_have ansible-vault && . <(register-python-argcomplete3 ansible-vault)
#_have ssh-agent && test -z "$SSH_AGENT_PID" && . <(ssh-agent)

# -------------------- personalized configuration --------------------

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"

_have terraform && complete -C /usr/bin/terraform terraform
_have terraform && complete -C /usr/bin/terraform tf

# ------------------------- NVM bullshit ahead ------------------------
# (keep as is or nvm idiotic installer will re-add to bashrc next time)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
