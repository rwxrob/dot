# Scripts

Interpreted scripts in POSIX shell, Bash, Perl, Ruby, Python, etc.

## Install

I symlink mine from to `~/.local/bin/scripts` since I use `~/.local/bin` to hold lots of stuff that isn't necessarily persistent.  From within this source directory (no matter where it is) just run the following from your command line, or you can use a fancy `vi` one-liner magic wand (`!!`).


```sh
mkdir -p ~/.local/bin/ && ln -sf "$PWD" ~/.local/bin/scripts
```

Don't forget to add this to your `$PATH` by adding something like the following to your shell configuration files:

```
export PATH=~/.local/bin/scripts:~/.local/bin:$PATH
```

## Why `/bin/sh`? 

Because on Debian-based systems `/bin/sh` is mapped to `/bin/dash` and more than twice as fast as modern Bash (even if a given script contains dependencies on another script that uses `/bin/bash`). Plus I don't believe in violating POSIX compliance unless there is something I really need from Bash (and that would save me for reaching for some gawd-awful bloated alternative like Python, Perl, Ruby, or even `awk`).
