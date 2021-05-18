#!/bin/sh

# Detection of interactivity. Shell *must* be
# interactive or *none* of this applies.

case $- in
*i*) ;;
*) return ;;
esac

# Detection of major operating systems.

[ -z "$OS" ] && export OS=$(uname)
case "$OS" in
Linux) export PLATFORM=linux ;;
*indows*) export PLATFORM=windows ;;
FreeBSD | Darwin) export PLATFORM=mac ;;
*) export PLATFORM=unknown ;;
esac

onmac() {
  [ "$PLATFORM" = mac ] && return 0
  return 1
}

onwin() {
  [ "$PLATFORM" == windows ] && return 0
  return 1
}

onlinux() {
  [ "$PLATFORM" == linux ] && return 0
  return 1
}

onunknown() {
  [ "$PLATFORM" == unknown ] && return 0
  return 1
}
