#!/bin/sh

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s histappend

# kills completion (for some) https://unix.stackexchange.com/a/276932
#shopt -s nullglob

# for the paranoid (who prefer >| for everything)
#set -o noclobber
