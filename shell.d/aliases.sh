unalias -a

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
alias tmpd='cd $(mktemp -d)'
alias mkdirisosec='d=$(isosec);mkdir $d; cd $d'

alias free='free -h'
alias df='df -h'
alias top="htop"

which vim &>/dev/null && alias vi=vim
