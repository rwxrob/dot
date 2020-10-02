#!/bin/sh
test -z "$1" && exit 1
yml="$HOME/.config/alacritty/alacritty.yml"
perl -p -i -e 's/^background_opacity:\s*\S+/background_opacity: .'$1'/' $yml
