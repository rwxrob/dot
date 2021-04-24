# Personal Dotfiles, Scripts, and Installers

![WIP](https://img.shields.io/badge/status-wip-red)

WARNING: This thing is *never* complete, full of bugs, and always
changing. [Pilfer](https://duck.com/lite?q=Pilfer) at your own risk.
(But *do* pilfer. I don't mind.)

I'm a fan of keeping things as portable and testable, as possible
(without sacrificing ultimate power and time when on workstation).
Therefore, I use a `shell.d` approach (my own thing, not something done
on any distro). I `source` stuff in my [bashrc](bashrc) but 
[build](build) a full, independent version every time I push any changes
I've accrued over the day or week. That way I can batch all that work
together rather than having it impact my day with an annoying forced
build. This also makes every section of my `.bashrc` shareable as is so
people can just download pieces of it that they might like instead of
the whole thing (you know, `curl`-able modularity).

## Why no `sed`, `awk`, `tr`, `cut`?

Usually people using any of these just don't know how to code shell. If
they did, they'd use parameter expansion instead of these unnecessary
and inconsistent sub-shell commands.

## Why `perl`? I thought `perl` was shit?

Because `perl` is still the best tool for the job many times (and the
only language that supports `\p{Ll}` in regular expressions).

I do prefer to redo most of my `perl` as POSIX shell these days so that
it is the most compatible with everything --- including `busybox`
containers (which have no `perl` or even `bash`).

### What about Python?

Python is a disastrously bad pick for most simple shell scripts. It's
way too verbose and bloated and never included by default in any
consistent way. I despite Python for these reasons for most things.

Python startup execution is so slow it is physically painful to use for
anything on the shell. Creating a one-liner or short script in Python is
a ridiculously bad choice given these facts, which is most *real*
hackers still prefer Perl over Python.

However, if you are doing enterprise deployments and infrastructure
automation or want to build a big thing that's not Java, and for some
stupid reason you can't do it in a *real* language like Go, then Python
is fine.

## Why one line scripts and not aliases or exported functions?

At one point many of these scripts were functions and aliases in a
massive `.bashrc` file. Then I realized aliases cannot be used at all
from within `vim`. Even exportable Bash functions required that I always
use Bash (which I still prefer, but Zsh cannot even export functions).
Scripts are also easier to share as independent POSIX shell or Perl
(which is also the reason I often repeat code in more than one script.)

## What's up with `exec`?

The `exec` allows the command and arguments passed to it to take the
space and process ID and signals receivers of the currently running
script effectively swapping the script out for what is called. This is
almost always better than calling it as a subprocess and waiting for it
to finish. For example, the PID, environment variables, signal handlers,
and any associated background jobs all remain. It is exactly the same as
if the executed command were run instead of the script calling it.

One example of this is anything with `tmux` that needs to be running in
the current shell, window, and pane.
