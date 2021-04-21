
export SCRIPTS=$REPOS/github.com/$GITUSER/dotfiles/scripts

pathappend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in 
      *:${ARG}:*) continue ;;
    esac
    PATH="${PATH:+"${PATH}:"}${ARG}"
  done
}

pathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    case ":${PATH}:" in 
      *:${ARG}:*) continue ;;
    esac
    PATH="${ARG}${PATH:+":${PATH}"}"
  done
}

pathprepend \
  "${SCRIPTS}" \
  "${HOME}/sdk/go1.16/bin" \
  "${HOME}/.local/bin" \
  "${HOME}/.local/go/bin" \
  "${HOME}/.cargo/bin" \
  "${HOME}/.node/bin" \
  "${HOME}/.deno/bin" \
  "${HOME}/bin" \

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

export PATH

# be sure not to remove ./ or stuff gets weird
export CDPATH=\
./:\
$REPOS/github.com/$GITUSER:\
$REPOS/github.com/$GITUSER/$GITUSER:\
$REPOS/github.com/*:\
$REPOS/github.com:\
$REPOS:\
$KEGPATH:\
/media/$USER:\
$HOME

