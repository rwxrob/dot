# Bash Shell Scripts

Bash scripts [Licensed under Mozilla Public License Version
2](https://duck.com/lite?kd=-1&kp=-1&q=Licensed+under+Mozilla+Public+License+Version+2).

## Install

I always suggest copying the ones you like into your own collection. But
if you want to clone the repo and symlink you can do that as well. Just
`cd` into this cloned repo directory and do something like the
following. 

> ⚠️ Make sure you read all the scripts and approve of what they
do if you do this.

```sh
mkdir -p ~/.local/bin/ && ln -sf "$PWD" ~/.local/bin/rwxrob
```

Don't forget to add this to your `$PATH` by adding something like the
following to your shell configuration files:

```sh
export PATH=~/.local/bin/rwxrob:~/.local/bin:$PATH
```

## Google Shell Style Guidelines

These scripts all strictly conform to [Google's excellent shell scripting
style guidelines](https://google.github.io/styleguide/shellguide.html)
(which should be mandatory reading for *anyone* writing shell scripts
professionally or personally).

## Why `/bin/bash` only? 

For the same reason Google mandates Bash for *all* shell scripting that
doesn't not *require* an alternative: consistency.

I cannot count how many times I have been burned by using a Bashism
after declaring `#!/bin/sh` at the top. In fact, the total amount of
time I have spent stupidly staring at perfectly good code that has the
wrong shebang line easily makes up for the total loss of time by
executing everything in Bash instead of Dash (`/bin/sh` on Debian).

Bash isn't noticeably slower to execute than Dash for stuff that I do
even though [Debian did drop Bash for system startup
scripts](https://duck.com/lite?kd=-1&kp=-1&q=Debian+dropped+Bash+for+system+startup+scripts)).

There's another reason: security.

Bash double bracket conditions (`[[ ]]`) forbid glob expansion making
them impervious to very dangerous shell injection attacks that are the
reason people have been wrapping all variables in double quotes for
years (which you should still do anyway).

Oh and Zsh is a disastrously bad shell to pick for anything.

## Why no `sed`, `awk`, `tr`, `cut`?

You must not understand shell programming if you are asking that
question. But it is understandable because the Internet is full of
absolutely shitty suggestions to use these.

The only reason *any* of those should ever be used is when doing one
line shell pipelines. There is *always* a better alternative that does
not invoke a subshell when writing a shell script. 

Most people have no idea how to leverage parameter expansion and Bash 4+
constructs like associative arrays and regular expressions. In fact,
having once been an avid Perl and Python programmer I find that Bash 4+
has everything I could have ever wanted in those languages up to the
point where I really just want to write it in Go instead. Bash and Go
are a marriage made in personal productivity heaven --- particularly
when you consider the power of `curl`, `auth`, `yq`, and `jq`
integration.

## Why the one line scripts and not an alias or function?

At one point many of these scripts were functions in a massive `.bashrc`
file. But they I realized it was easier to share them as stand alone
scripts and that some of them could be done in POSIX shell allow me to
share them with Zsh users (who can't use exported functions at all).
