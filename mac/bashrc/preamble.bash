
# There really is no reason to *not* use the GNU utilities for your login
# shell but there are lot of reasons *to* use it. The only time it could
# present a problem is using other shell scripts written specifically for
# Mac (darwin/bsd). There are far more scripts written to use the GNU
# utilities in the world. Plus you finger muscle memory will be consistent
# across Linux and Mac.

if onmac; then
  if ! havecmd gls; then
    echo 'Need to `brew install coreutils` for Mac to work.'
  fi 
fi

