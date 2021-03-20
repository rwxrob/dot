
# map capslock to control (X only)
#setxkbmap -option ctrl:ctrl_modifier

# remap capslock for whole system to ESC (X only)
if [ -n "${DISPLAY}" ];then
  setxkbmap -option caps:escape
fi

export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi

if [ -d ~/.vim/spell ]; then
  export VIMSPELL=(~/.vim/spell/*.add)
fi

if [ -d ~/.vimpersonal ]; then
  personalspell=(~/.vimpersonal/spell/*.add)
  [ -n "$personalspell" ] && VIMSPELL=$personalspell
fi

if [ -d ~/.vimprivate ]; then
  privatespell=(~/.vimprivate/spell/*.add)
  [ -n $privatespell ] && VIMSPELL=$privatespell
fi

