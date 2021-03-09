# Personal Dotfiles

![WIP](https://img.shields.io/badge/status-wip-red)

WARNING: This thing is *never* complete, full of bugs, and always
changing. [Pilfer](https://duck.com/lite?q=Pilfer) at your own fucking
risk. (But *do* pilfer. I don't mind.)

I'm a fan of keeping things as portable and testable, as possible
(without sacrificing ultimate power and time when on workstation).
Therefore, I use a `bashrc.d` approach (my own thing, not something done
on any distro). I `source` stuff in my [bashrc](bashrc) but 
[build](build) a full, independent version every time I push any changes
I've accrued over the day or week. That way I can batch all that work
together rather than having it impact my day with an annoying forced
build. This also makes every section of my `.bashrc` shareable as is so
people can just download pieces of it that they might like instead of
the whole thing (you know, `curl`-able modularity).

## Why no `sed`, `awk`, `tr`, `cut`?

Cuz they are deprecated, slow, old, busted boomer tech. (I don't fucking
care what your Cybersecurity course or bootcamp told you.) Perl was
literally created because of how broken and slow they are.

You really must not understand shell programming if you are asking this
question in 2021. But that is understandable because the Internet is
full of absolutely shitty suggestions. 

The only time these make sense is when working with single pipelines
from a shell on a computer that you don't control when `perl` or `bash`
is not available (which describes a lot of BSD users).

## Why `perl`? I thought `perl` was shit?

If you find yourself joining the trendy club of modern clueless people
hating on Perl (instead of first understanding it) you might want [to
read this](https://rwx.gg/advice/dont/perlhate) before you make a fool
of yourself.

Perl is the world's most ubiquitous and powerful shell scripting
language and the world authority for modern regular expressions (PCRE is
literally in everything.) For example, Perl added `\p{Ll}` (Unicode
Lower Letter) and things like it years before others. (As of March 2021,
Bash still does not have it.)

### What about Python?

Note the word 'ubiquitous' above regarding Perl, meaning that it is
already available and installed Python is not, at least not at any
reliable version level. Python also has absolutely shitty command line
constructs because it was not created for the same reasons as Perl.

Python startup execution is so slow it is physically painful to use for
anything on the shell. Creating a one-liner or short script in Python is
a ridiculously bad choice given these facts, which is most *real*
hackers still prefer Perl over Python.

## Why one line scripts and not aliases or exported functions?

At one point many of these scripts were functions and aliases in a
massive `.bashrc` file. Then I realized aliases cannot be used at all
from within Vi and that functions required they be exported and that I
always use Bash (which I still prefer, but Zsh cannot even export
functions). Scripts are also easier to share as independent POSIX shell
or Perl.

## What's up with `exec`?

The `exec` allows the command and arguments passed to it to take the
space and process ID of the currently running script effectively
swapping the script out for what is called. This is almost always better
than calling it as a subprocess and waiting for it to finish. For
example, the PID, environment variables, and any associated background
jobs all remain. It is exactly the same as if the executed command were
run instead of the script calling it.

One example of this is anything with `tmux` that needs to be running in
the current shell, window, and pane.

## Why such a minimal prompt?

Not a fan of ridiculously distracting command prompts. Prompt should
fade into background, not demand focus.

The `printf` magic ensures that any output that does not end with a
newline will not put a prompt immediately after it. 

Never forget the \[$color\] brackets that escape the width of the color
escapes so they don't affect line wrapping.

## Why so few aliases?

Keep in mind that aliases *cannot* be used from anything but the
currently active shell (not subprocesses or any system `exec()` calls).
Generally exported functions should be used instead (as recommended by
the bash/zsh man pages).

Every alias you add is one additional thing that won't work on a remote
system you don't own or haven't customized. Better to memorize the
switch of commands so your fingers know what to do on *any* system.
(Also the reason to learn `vi` over `emacs`.)

## TODO

* Get the prompt Bash stuff ported to Zsh (`%{ %} %m %u`)
