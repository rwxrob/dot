# Dotfiles, scripts, and stuff

Pilfer at your own peril. Follow if you like. Sponsor if you're an angel.

Unlike other projects, I regularly just commit to main with short commit messages (see [`scripts/savedot`](scripts/savedot)). I regularly commit multiple times per day. You have been warned.

## Working style

I'm an old SysAdmin, a Software Developer Engineer, an SRE, a hacker, a writer, and educator. This means that while I do have a favorite, cozy dev environment on my 14" Macbook Pro, I still want my dotfiles to work anywhere.

I've designed this repo to be something I can quickly clone to any system and just run [setup](setup) plus a few `install` scripts for the stuff I need to get immediately up and running. This process is so fast that I consider all the other Git clones read-only and only pull from changes made to this central repo. That way I never have a merge conflict and can use these dotfiles without fear that committing from a system that isn't one I own could give a company full ownership of the entire repo per IP policies (go watch season one of Silicon Valley).

To keep `git clone` operations fast I regularly rebase this Git repo.

I've tried workspace containers in the past and it is just too much hassle to keep the up to date even with CI/CD. Who knows, maybe I'll try again some time. Probably not, however, because I don't always need all the stuff that I install on my cozy workstation. Hence all the `install` scripts.

## Interactive shell

I use `zsh`, `bash`, and `ksh` for my interactive shells. My `config/shell` has an `rc` file that can be used for `~/.bashrc` or `~/.zshrc`. The `config-shell` command senses the current shell and does the right thing.

## Dependencies

Check out my [FAQ](https://github.com/rwxrob/faq) for answers about my preferences for dependencies.

- POSIX shell (`/bin/sh`)
- Vim or NeoVim (hence the `~/.vimrc` AND `init.lua`)
- WezTerm (no I do not like Ghostty, no dynamic config)
- Perl v5.36 (`/usr/bin/env perl`)

For other dependencies see the scripts that begin with `install` and `config`.

