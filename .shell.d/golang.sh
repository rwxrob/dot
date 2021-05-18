#!/bin/sh

export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOPATH="$HOME/.go"
export GOBIN="$HOME/.go/bin"
export GOPROXY="direct"
export CGO_ENABLED=0
