#!/bin/sh

g=
c=
r=

if test -t 1; then
  g="\e[1;30m"
  c="\e[1;34m"
  r="\e[0m"
fi

echo "${c}dap${r}  - ${g}delete around current paragraph${r}"
echo "${c}dip${r}  - ${g}delete current paragraph${r}"
echo "${c}diw${r}  - ${g}delete current word${r}"
echo "${c}daw${r}  - ${g}delete around current word${r}"
echo "${c}diW${r}  - ${g}delete current larger word (ex: --foo-bar)${r}"
echo "${c}daW${r}  - ${g}delete around current larger word${r}"
echo "${c}yap${r}  - ${g}yank around current paragraph${r}"
echo "${c}yip${r}  - ${g}yank current paragraph${r}"
echo "${c}ea ${r}  - ${g}append to current word${r}"
echo "${c}cw ${r}  - ${g}change to end of current word${r}"
echo "${c}ciw${r}  - ${g}change current word${r}"
echo "${c}caw${r}  - ${g}change around current word${r}"
echo "${c}dw ${r}  - ${g}delete to beginning of next word${r}"
echo "${c}daf${r}  - ${g}delete current function${r}"
echo "${c}yaf${r}  - ${g}yank current function${r}"
echo "${c}dif${r}  - ${g}delete current inner function${r}"
echo "${c}yif${r}  - ${g}yank current inner function${r}"
echo "${c}dd${r}   - ${g}delete the current line${r}"
echo "${c}gqip${r} - ${g}wrap the current paragraph${r}"
echo "${c}gqap${r} - ${g}wrap around the current paragraph${r}"
echo "${c}>ip${r}  - ${g}indent the current paragraph${r}"
echo "${c}<ip${r}  - ${g}dedent the current paragraph${r}"
echo "${c}!ip${r}  - ${g}send the current paragraph to shell command${r}"
