
export SCRIPTS=$REPOS/github.com/$GITUSER/dotfiles/scripts

export PATH=\
$SCRIPTS:\
$HOME/sdk/go1.16/bin:\
/usr/lib/go-1.15/bin:\
$HOME/.local/bin:\
$HOME/.local/go/bin:\
$HOME/.cargo/bin:\
$HOME/.node/bin:\
$HOME/.deno/bin:\
$HOME/bin:\
/usr/local/opt/coreutils/libexec/gnubin:\
/mingw64/bin:\
/usr/local/go/bin:\
/usr/local/tinygo/bin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/games:\
/usr/sbin:\
/usr/bin:\
/snap/bin:\
/sbin:\
/bin

# be sure not to remove ./ or stuff gets weird
export CDPATH=\
./:\
$REPOS/github.com/$GITUSER:\
$REPOS/gitlab.com/$GITUSER:\
$REPOS/github.com/*:\
$REPOS/gitlab.com/*:\
$REPOS/github.com:\
$REPOS/gitlab.com:\
$REPOS:\
/media/$USER:\
$HOME

