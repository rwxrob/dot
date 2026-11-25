# Unix/Linux dotfiles, scripts, and stuff

Pilfer at your own peril. If you are thinking of following, just know I commit to main about once every three days, if I had several commits I will put them in a draft PR to avoid blowing followers away with commit notifications.

Don't forget to install [fonts](https://github.com/rwxrob/fonts) as well if you want to use everything in here.

## What's here

| Directory             | What it is                                                                                                                                              |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`config/`](config)   | Configuration, one directory per tool ([`bash`](config/bash), [`vim`](config/vim), [`tmux`](config/tmux), [`git`](config/git), ...), most with a `setup` |
| [`install/`](install) | `install-*` scripts that install tools ([`mac`](install/mac), [`ubuntu`](install/ubuntu), [`redhat`](install/redhat), [`windows`](install/windows))     |
| [`bin/`](bin)         | Small standalone commands that go on your `PATH`, indexed in [`bin/README.md`](bin/README.md)                                                           |

Nothing in the repo is a hidden file. Files like `config/bash/bashrc` are plain names so they show up in `ls`, and each tool's `setup` script creates the dotted symlink in `$HOME` (`~/.bashrc`, `~/.tmux.conf`, ...).

To link everything into place run `./setup` from the repo root. A tool whose `setup` fails (usually because the tool is not installed) is reported at the end and never stops the others. To set up just one tool run `./setup` inside its directory, for example `config/vim/setup`.

These are not part of `./setup`: [`cowsay`](config/cowsay), [`fortunes`](config/fortunes) and [`obs`](config/obs) are just files to use or copy.

## Where things live

- `bashrc` finds this repo through `$DOTFILES` and puts `$DOTFILES/bin` on your `PATH`. Nothing depends on a `~/Scripts` directory or a `$SCRIPTS` variable.
- Machine-specific values (`GITUSER`, `DOTFILES`, `TZ`) are written once by `config/bash/setup` to `~/.config/dot/env`, which is never committed. Git identity and signing keys are set by `config/git/setup` into your untracked `~/.gitconfig`.
- Author-specific bash settings live in `config/bash/personal`. Fork the repo and edit that file to make it yours; `bashrc` stays generic.
- Repositories are expected under lowercase `~/repos` (`~/repos/github.com/<user>/dot`), and `CDPATH` is never used anywhere.

## Operating system preference

Everything in this repo will work on any Unix or Linux system once the dependencies are satisfied. As for host workstation operating systems I personally prefer the following in order:

1. macOS (Unix)
2. WSL2 with `wslu` (Linux)
3. Linux Mint Cinnamon

Note that much of this repo content will also work with Git-Bash, Cygwin, and MinGW but not all.

## Core dependencies

Before running any `install-*` script make sure the system has:

- `/bin/sh` (POSIX 2018, no `ksh`-isms)
- `/usr/bin/perl` (v5.26 which modern `git` depends on)
- `git`
- `curl`
- `uname`

Note that `perl`—required for any `git` install—is used more efficiently and powerfully than any of the usual handicapped alternatives: `sed`, `awk`, `grep`, `head`, `tail`, `cut`, `tr`, etc.

In true Unix fashion, many of the scripts in `bin/` depend on one another and on the tools the `install-*` scripts provide.

## Installing tools

On macOS, [`install/mac/install-most-stuff-with-brew`](install/mac/install-most-stuff-with-brew) installs most of what the config expects with Homebrew. On Ubuntu, [`install/ubuntu/install-most-stuff-with-apt`](install/ubuntu/install-most-stuff-with-apt) does the same, and the other `install-*` scripts there install a single tool from its latest official release, usually by way of `gh release download` or `go install`.

## Scripts over functions and aliases

Even a one-line script works anywhere: as a Vim filter, pipeline text transformation, and interactive command. _Functions cannot be called universally from other executables._ In fact, the _only_ time a function should ever be used is when the state of the current shell needs to change, such as changing the current working directory (see the `clone` and `cdd` functions in `config/bash/bashrc`).

Aliases are nice to same typing on the command line, but that is the only place they should ever be used. Very often an alias is better as a one-line script.

### The `cdd` function

`cdd NAME` changes into the first directory called `NAME` (or whose name contains it, ignoring case) found below the roots in `$CDD`, a `PATH`-like list set in `config/bash/personal`. It is a function because only a function can change your directory, and unlike `CDPATH` it never changes plain `cd`, so scripts are unaffected. Hits are cached; `cdd -f NAME` searches again. See the comment above `cdd` in `bashrc` for the details.

## Checking changes

Run `./check` before committing. It changes nothing and checks shell syntax, `shellcheck` errors, Markdown (with `rumdl`) and a few repo rules, such as every script in `bin/` having a row in its index. It needs `shellcheck` and `rumdl`.

## More info

Check out my [FAQ](https://github.com/rwxrob/faq) for more answers about my work style, preferences, and dependencies.
