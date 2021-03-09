# This file is only here because some brain-dead
# applications require it.

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
        ps1min
    fi
fi

export PATH="$HOME/.cargo/bin:$PATH"
