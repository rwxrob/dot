#!/bin/sh

is_dir() {
  RVAL=""
  test -d "$1" && RVAL="$1" && return 0
  return 1
}

scripts_repo() {
  is_dir "$REPOS/github.com/$GITUSER/scripts" && return 0
  is_dir "$REPOS/github.com/$GITUSER/dotfiles/scripts" && return 0
  is_dir "$REPOS/github.com/$GITUSER/dot/scripts" && return 0
  is_dir "$HOME/.local/bin/scripts" && return 0
  return 1
}

detect_scripts_repo() {
  test -z "$GITUSER" -o -z "$REPOS" && return 1
  scripts_repo || return 1
  export SCRIPTS="$RVAL"
  return 0
}

pathappend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in
    *:${ARG}:*) continue ;;
    esac
    export PATH="${PATH:+"${PATH}:"}${ARG}"
  done
}

pathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in
    *:${ARG}:*) continue ;;
    esac
    export PATH="${ARG}${PATH:+":${PATH}"}"
  done
}

cdpathappend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${CDPATH}:" in
    *:${ARG}:*) continue ;;
    esac
    export CDPATH="${CDPATH:+"${CDPATH}:"}${ARG}"
  done
}

cdpathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${CDPATH}:" in
    *:${ARG}:*) continue ;;
    esac
    export CDPATH="${ARG}${CDPATH:+":${CDPATH}"}"
  done
}

detect_scripts_repo

pathprepend \
  "${SCRIPTS}" \
  "${HOME}/.go/bin" \
  "${HOME}/.local/bin" \
  "${HOME}/.cargo/bin" \
  "${HOME}/.node/bin" \
  "${HOME}/.deno/bin" \
  "${HOME}/bin"

pathappend \
  "/usr/local/opt/coreutils/libexec/gnubin" \
  "/mingw64/bin" \
  "/usr/local/go/bin" \
  "/usr/local/tinygo/bin" \
  "/usr/local/bin" \
  "/usr/local/sbin" \
  "/usr/games" \
  "/usr/sbin" \
  "/usr/bin" \
  "/snap/bin" \
  "/sbin" \
  "/bin"

cdpathprepend "./"
if test -n "$REPOS"; then
  cdpathappend "$REPOS/github.com"
  if test -n "$GITUSER"; then
    cdpathappend \
      "$REPOS/github.com/$GITUSER" \
      "$REPOS/github.com/$GITUSER/$GITUSER"
  fi
  cdpathappend \
    "$REPOS/github.com/*" \
    "$REPOS" \
    "/media/$USER" \
    "$HOME"
fi
