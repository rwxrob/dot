# Scripts

Pilfer as you will, but use at your own peril.

## Installation

Best way to use these is grab them and put them into your own stuff.
Technically, you are supposed to mention me if you do that (per Apache
license), but whatever.

The `.bashrc` in this `dot` repo is set to look in
`~/.local/bin/scripts` for stuff (and sets `$SCRIPTS` to that location)
but many of these scripts only work if `$SCRIPTS` is pointing to
something within a GitHub repo. So you might want to override that in
your `.bash_{personal,private,work}` file (from another repo,
presumably).

## What's a "shortcut command"?

A *shortcut command* is an alternative to aliases (which do not work
with subprocesses such as from within an editor session. You will see
this term a lot in the commit messages. Usually such a command will only
be two lines long.

## POSIX, Perl, or Python

Even though I have some `bash` still in here, my goal these days is to
use nothing but POSIX shell, `perl`, and `python3` for everything. POSIX
shell is the most widely supported (for Dockerfile builds and such) and
`perl` is the fastest prototyping language on the planet (unless you
*really* need OOP in which case `python` is the best choice for
*prototyping*. (Surprisingly enough, `python` and `perl` address
completely different needs and use cases that rarely *actually* overlap,
but the world is full of morons who try to argue they are the same.)

## Perl Power Scripts

Perl was primarily created to replace `sed`, `awk`, `tr`, and `cut` and
did it so well it became the de facto lingua franca of all server-side
web development for over two decades.

I really hate `sed` for all the reasons Larry Wall did, but mostly its
absolutely horrible BRE syntax. Using any of the PCRE variations are
not POSIX, might as well just use `perl` instead in those cases.

Script|Full|Purpose
|:-:|:-:|-
`pie`|`perl -p -i -e`|Inplace edit
`pae`|`perl -paE`|Replace `sed` and `awk` (prints line)
`map`|`perl -aE`|Replace `sed` and `awk` (no printing)
