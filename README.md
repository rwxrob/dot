# Personal Dotfiles, Scripts, and Installers

![WIP](https://img.shields.io/badge/status-wip-red)

WARNING: This thing is *never* complete, full of bugs, and always
changing. [Pilfer](https://duck.com/lite?q=Pilfer) at your own risk.
(But *do* pilfer. I don't mind.)

I'm a fan of keeping things as portable and testable, as possible.
Therefore, I use a `shell.d` approach (my own thing, not something done
on any distro). I `source` stuff in my [bashrc](bashrc) This makes every
section of my `.bashrc` shareable so others people can just download
pieces of it that they might like instead of the whole thing.

## Best Screen Dimensions

While any dimensions should work, this workspace has been optimized for
(the very unusual) 76 columns and 21 rows optimized for streaming
(including to mobile devices) and presentations (classrooms, meetups,
etc.).

## What distro do you use?

I use PopOS! because it is the simplest and most reliable distro I've
ever used. I also regularly use this workspace on Windows with Docker
installed. If I want complexity and stuff like the AUR I can just create
a container easily with the `run` script.

## Why not include all the scripts in the Dockerfile?

I [did](https://github.com/rwxrob/workspace).

## Why one line scripts and not aliases or exported functions?

At one point many of these scripts were functions and aliases in a
massive `.bashrc` file. Then I realized aliases cannot be used at all
from within `vim`. Even exportable Bash functions required that I always
use Bash for my interactive shell. Scripts are also easier to share and
include into containers as independent POSIX shell. For anything more
complex I'll compile a [CmdBox](https://github.com/rwxrob/cmdbox) Go
utility (like [Pomo](https://github.com/rwxrob/cmdbox-pomo).

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

## What's up with `RVAL`?

Setting the global `$RVAL` variable in a script function has long been a
convention to get around the fact that strings cannot be returned.

## Why only GitHub?

Because it is the industry/enterprise standard. GitLab lost. The rest weren't
even in the race. I hate that so much power is consolidated with GitHub, but
any pragmatist will likely make the same decision. The `gh` tool and superior
GitHub API destroys everything else in the field and has a strong group
sustaining it.

GitHub has also demonstrated far greater support for open source
developer sponsorships even though they are owned by Microsoft.
