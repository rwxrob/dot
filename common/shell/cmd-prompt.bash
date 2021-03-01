
# Not a fan of ridiculously distracting command prompts. Prompt should
# fade into background, not demand focus. The printf magic ensures that
# any output that does not end with a newline will not put a prompt
# immediately after it. Never forget the \[$color\] brackets that escape
# the width of the color escapes so they don't affect line wrapping.

# See https://github.com/ryanoasis/powerline-extra-symbols

export glypharrow=$'\ue0b0'
export glyphflames=$'\ue0c0'
export glyphrounded=$'\ue0b4'
export glyphbits=$'\ue0c6'
export glyphhex=$'\ue0cc'
export glyphbranch=$'\ue0a0'
export glyphrarrow=$'\u279c'

export PS1w=$'\033[38;5;33m'
export PS1u=$'\033[38;2;0;165;0m'
export PS1a=$'\033[38;2;100;100;100m'
export PS1c=$'\033[38;2;110;110;110m'
export PS1h=$'\033[38;2;169;112;255m'
export PS1p=$'\033[38;2;218;165;32m'
export PS1P=$'\033[38;2;255;0;0m'
export PS1U=$PS1P

export gruv_orange=$'\033[38;2;214;93;13m'
export gruv_purple=$'\033[38;2;211;134;155m'

if [[ $EUID == 0 ]]; then
  export PS1='\[$PS1U\]\u\[$PS1a\]@\[$PS1h\]\h\[$PS1c\]:\[$PS1w\]\w\[$PS1P\]#\[\033[00m\] '
else
  export PS1='\[$PS1u\]\u\[$PS1a\]@\[$PS1h\]\h\[$PS1c\]:\[$PS1w\]\w\[$PS1p\]$\[\033[00m\] '
fi

ps1min () {
  export PS1='\[\033[0;34m\]\W$(__git_ps1 "${PS1c}:${gruv_purple}%s")\[\033[0;33m\]\$\[\033[00m\] '
  #export PS1='$ '\033[0;35m
}

