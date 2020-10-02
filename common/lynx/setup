#!/bin/bash

declare -r cyan=$'\033[38;2;0;255;255m'
declare -r gold=$'\033[38;2;245;160;12m'
declare -r reset=$'\033[0m'

if [ -z "$(which lynx)" ]; then
  echo Need to install lynx.
  exit 1
fi

mkdir ~/.config/ 2>/dev/null
rm -rf ~/.config/lynx 2>/dev/null
ln -s "$PWD" "$HOME/.config/lynx"
ls -l ~/.config/lynx

echo $gold"Now just put lynx into your PATH or update your PATH to look something like the following:"
echo ""
echo $cyan"export PATH=\"$PWD:$PATH\""$reset
