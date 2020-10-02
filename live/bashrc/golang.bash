
############################# Go Development #############################

# Not being able to use private repos by default with Go is really
# annoying. This is the standard way to overcome that.

export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOBIN="$HOME/.local/go/bin"
mkdir -p $GOBIN
export GOPATH="$HOME/.local/go"
export GOPROXY="direct"

# Changes into the first Go directory (from GOPATH) matching the name
# passed by looking up the package by specifying the ending string of the
# package name. Prompts for selection if more than one match.  Useful for
# quickly examining the source code of any Go package on the local system.
# (Because this needs to change the current working directory it is
# better as an exported Bash function than a script.)

gocd () {
  local q="$1"
  local list=$(go list -f '{{.Dir}}' ...$q 2>/dev/null)
  IFS=$'\n' local lines=($list) # split lines
  case "${#lines}" in
    0) telln 'Nothing found for "`'$q'`"' ;;
    1) cd $n ;;
    *) select path in "${lines[@]}"; do cd $path; break; done ;;
  esac
}
