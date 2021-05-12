#!/bin/sh

# Both REPOS and GITUSER can (and often should) be overriden in
# personal, private, or work imported rc modules later.

export REPOS="$HOME/repos"
if [ git ] >/dev/null 2>&1; then
  test -z "${GITUSER}" && export GITUSER="$(git config --global user.name)"
fi
