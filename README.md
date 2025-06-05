# Unix/Linux dotfiles, scripts, and stuff

Pilfer at your own peril. If you are thinking of following, just know I commit to main about once every three days, if I had several commits I will put them in a draft PR to avoid blowing followers away with commit notifications.

## Operating system preference

Everything in this repo will work on any Unix or Linux system once the dependencies are satisfied. As for host workstation operating systems I personally prefer the following in order:

1. macOS (Unix)
2. WSL2 with `wslu` (Linux)
3. Linux Mint Cinnamon

Note that much of this repo content will also work with Git-Bash, Cygwin, and MinGW but not all.

## Check core dependencies

Run the `check-workstation-deps` script to check if the current system has everything required before running any `install-*` script:

- `/bin/sh` (POSIX 2018, no `ksh`-isms)
- `/usr/bin/perl` (v5.26 which modern `git` depends on)
- `git`
- `curl`
- `uname`

Note that `perl`—required for any `git` install—is used more efficiently and powerfully than any of the usual handicapped alternatives: `sed`, `awk`, `grep`, `head`, `tail`, `cut`, `tr`, etc.

In true Unix fashion, many of the `scripts` depend on one another and most depend on everything in `install-all` to have been installed.

## Install into ~/.local

This repo is designed to work on both a cozy personal workstation as well as a multi-user system. In the later case it can never be assumed that I have access or the desire to install many of these tools or their dependencies for every user on the system. Plus there is the complication of choosing any of several different package managers. Instead, all `install-*` scripts install from the latest official release directly into `~/.local/` usually by way of `gh release download` or `go install`.

## Scripts over functions and aliases

Even a one-line script works anywhere: as a Vim filter, pipeline text transformation, and interactive command. _Functions cannot be called universally from other executables._ In fact, the _only_ time a function should ever be used is when the state of the current shell needs to change, such as changing the current working directory (see `clone` function).

Aliases are nice to same typing on the command line, but that is the only place they should ever be used. Very often an alias is better as a one-line script.

## More info

Check out my [FAQ](https://github.com/rwxrob/faq) for more answers about my work style, preferences, and dependencies.
