# Scripts

Pilfer as you will, at your own peril.

## LICENSE 

[Licensed under Mozilla Public License Version
2](https://duck.com/lite?kd=-1&kp=-1&q=Licensed+under+Mozilla+Public+License+Version+2).

## Live-Related Scripts

Script|Purpose
|:-:|-
`t`|Change topic on all services, start pomo
`f`|Clears and prints to screen in large text looping
`off`|Prints 'off screen" (calls `f`)
`back`|Prints 'back' with args (calls `f`)
`muted`|Prints 'no sound, off screen, mentoring' (calls `f`)
`figl`|Just print stdin to screen (called by `f`)

## What's a "shortcut command"?

A *shortcut command* is my alternative to aliases (which do not work with
subprocesses such as when using [Vim magic](https://rwx.gg/vimagic). You
will see this term a lot in the commit messages. Usually such a command
will only be two lines long.

## Perl Power Scripts

Script|Full|Purpose
|:-:|:-:|-
`pie`|`perl -p -i -e`|Inplace edit
`pae`|`perl -paE`|Replace `sed` and `awk` (prints line)
`map`|`perl -aE`|Replace `sed` and `awk` (no printing)

## Why no `sed`, `awk`, `tr`, `cut`?

Cuz they are deprecated, slow, old, busted boomer tech. (I don't fucking
care what your Cybersecurity course or boot camp told you. They are and
I can prove it.)

You really must not understand shell programming if you are asking this
question in 2021. But that is understandable because the Internet is
full of absolutely shitty suggestions. 

The only time these make even remote sense is when working with single
pipelines from a shell. 

*Never* put these in a modern script unless you have been given an
absolute directive not to use anything but POSIX shell (in which case,
by all means, its the only thing you have). But anyone holding you to
that must have a really good reason since Bash is the default Linux
shell and Perl has been installed on every single UNIX/Linux OS since
the year 1996. Perl was designed specifically to make up for the flaws ---
some security related --- within the alternatives and replace them.

And if you find yourself joining the trendy club of modern morons hating
on Perl instead of first understanding it you might want [to read
this](https://rwx.gg/advice/dont/perlhate) before you make a fucking
fool of yourself.

## Why the one line scripts and not an alias or function?

At one point many of these scripts were functions in a massive `.bashrc`
file. But they I realized it was easier to share them as stand alone
scripts and that some of them could be done in POSIX shell allow me to
share them with Zsh users (who can't use exported functions at all).
