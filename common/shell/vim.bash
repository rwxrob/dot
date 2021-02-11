
# remap capslock for whole system to ESC (X only)
setxkbmap -option caps:escape

export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi

export VIMSPELL=(~/.vim/spell/*.add)
declare personalspell=(~/.vimpersonal/spell/*.add)
[ -n "$personalspell" ] && VIMSPELL=$personalspell
declare privatespell=(~/.vimprivate/spell/*.add)
[ -n $privatespell ] && VIMSPELL=$privatespell

