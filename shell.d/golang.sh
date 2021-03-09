export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOBIN="$HOME/.local/go/bin"
mkdir -p $GOBIN
export GOPATH="$HOME/.local/go"
export GOPROXY="direct"

