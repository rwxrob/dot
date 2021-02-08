
export DENO_INSTALL="$HOME/.deno"

export SCRIPTS=\
$REPOS/gitlab.com/$GITUSER/dotfiles/scripts:\
$REPOS/github.com/$GITUSER/dotfiles/scripts

# be sure NOT to add ./ cuz it's unsafe
export PATH=\
$SCRIPTS:\
/usr/lib/go-1.15/bin:\
$HOME/.local/bin:\
$HOME/.local/go/bin:\
$HOME/.cargo/bin:\
$HOME/.node/bin:\
$HOME/.deno/bin:\
/usr/local/opt/coreutils/libexec/gnubin:\
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

