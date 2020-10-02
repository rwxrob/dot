

## Dependencies

This configuration assumes the following commonly used dependencies are either fulfilled on the system or will be. See the [install](install) subdirectory for help installing them:

* Bash 4+
* GNU Core Utilities
* Vim 8+
* TMUX
* Go 1.13+
* Node
* [Browsersync](http://www.browsersync.io/)
* Solarized Terminal

## Sample Personal Configuration Repo

This configuration works best for most by simply using it as-is and creating a `personal` repository with symlinked `~/.bash_personal` where everything can be overridden and further customizations can be added that use the many functions available. Use the following sample personal directory to get started.

TODO <https://github.com/rwxrob/config-sample-personal>

## Origins in Educational Use

This configuration was originally created to make learning the Bash terminal more fun and educational for kids as young as nine. By using the colors and prompt function rather interesting command-line programs can be made rather easily. Systems are easily configured and updated simply by cloning this repo and re-running setup. This is ideal for educational systems even through every student must setup their own GitHub account and Linux configuration to do it. 

After initially configured they can then incrementally make improvements by adding their own stuff to their `.bash_personal` configuration.

## Preferences

If these preferences match yours then you are in the right place. Otherwise, just take whatever you like.

* **Bash** 4+ is the obvious best shell to use. Don't even try using any of this without it -- especially zsh² users. I prefer testing boolean conditions with `-z "$SOME"` and `-n "$SOME"` than the alternatives because they are so fraught with peril.

* **Vim** without arrow-keys³ and other stuff that would make me unable to remember/use `vi` on a plain UNIX system.

* **Minimal distractions** instead of the ridiculously loud "powerline" and "oh-my-\*" approaches that throw everything in the prompt. Science shows that prompts should fade into the background as much as possible, not dominate your focus.

* **Fewer files** for easy copying onto remote systems being worked on (or hacked).

## What is a terminal master? 

**WARNING:** *Strong (researched) opinions ahead. This is meant to be a little funny and sarcastic. I'm sure plenty reading it will be offended anyway. Oh well.*

A *terminal master* ...

* Eats and breaths terminal doing almost everything on it.
* Averages 80+ words a minute typing normal things.
* Completes tasks 10x faster than same tasks with GUI.
* Craves efficiency without giving up aesthetics.
* Picks colors/prompts based on science, not flash.
* Loves the scientific Solarized color scheme.
* Finds command line versions of all applications.
* Creates aliases whenever possible.
* Maintains a healthy collection of shell functions.
* Uses `curl` and web APIs to make powerful functions.
* Builds prototype apps in Bash before Go, Rust, or C.
* Prefers exporting functions instead of writing scripts.
* Recognizes that Bash is objectively superior.
* Appreciates that Bash is on 99% of Linux systems.
* Never uses `sed`, `awk`, `tr`, `perl` unless forced (POSIX).
* Understands and respects POSIX, but only when needed.
* Won't use anything but Bash 4+ when possible.
* Understands what subshells are and why to avoid.
* Would never depend on a terminal "framework".
* Demands to maintain their own configuration.
* Prepares for *any* system not just their laptop.
* Laughs at silly oh-my-shitty-shell prompts.
* Knows that `vi` is the one true (visual) editor.
* Uses `vim` for everything with `vi` muscle memory.
* Has `vi` mode set for everything.
* Thinks `emacs` users are confused and short-sighted.
* Thinks VSCode users are fine if they are just learning.
* Uses magic wand (`!`) for most everything in `vim`.
* Prefers writing a Bash function over vimscript.
* Knows vimscript enough to customize plugins or more.
* Almost never starts a shell without `tmux`.
* Has `tmux` configured like `screen` and `vi` and knows why.
* Never uses CTRL-c/CTRL-v to cut/paste.
* Knows how much Apple broke mouse designs and why.
* Knows and practices search-centricity.
* Searches the web with `?` and `??` aliases.
* Finds in 10 seconds what takes 10 minutes with GUI.
* Considers JavaScript-only sites idiotic and bad for web.

There are many mediocre technologists who can't be bothered by the "trouble" it takes to become a terminal master. But the fact is, terminal mastery significantly distinguishes you from anyone else with otherwise similar skills. You will perform tasks far faster than your GUI peers.

## Vim with Vi Muscle Memory

Vim is the undisputed original one-true editor. The following are included by default. The rest can go in `~/.vimpersonal` which shares the `~/.vimplugins` directory of plugin repos.

* Solarized
* Pandoc

***Learn without arrow keys and `Ctrl-[` instead of `ESC` key.***

### *Why no NeoVim?*

Because it provides no additional benefit beyond that already provided by Vim -- especially when combined with a terminal multiplexer such as `screen` or `tmux`, which we believe all terminal masters should learn as a matter of course. Moreover, encourage further use of *vim script* promotes a non-divided ecosystem of plugins, which are at the core of Vim productivity and adaptability.

There are many other reasons to pick Vim 8.2+ over NeoVim. Research them if you care.

### *How do I add a plugin?*

Plug,[@junegunn](https://twitch.tv/junegunn)'s [minimalist Vim plugin manager](https://github.com/junegunn/vim-plug), has been [included](vim/autoload/plug.vim) since it makes sense to do so. The other plugins are then loaded during `setup`. Plug is particularly important because it does not require the plugins to live anywhere within the configuration. So this configuration uses the reasonable `~/.vimplugins` to keep it separate.

To add a plugin simply add it to the *Plug* section of your `vimrc` and run the following, which you can alias to `vimplugininstall` if you like:

```sh
vim +':PlugInstall' +':q!' +':q!''
```

### *Why Plug?*

Because is not as fat as all it's older cousins and puts the plugins in a reasonable place allowing better git repo management of Vim configuration.

### *Why only these plugins?*

Modern `vim` does most of what want out of the box by default.

*Plug* is so good at managing and setting up any of the few plugins that you might actually want that it makes little sense to force personal preferences on you other than those that are considered standard by the industry for a particular usage.

## Lynx Text Web Browser

![Logo](logo.png)

* Colors optimized for Solarized Dark
* Vi/m navigation bindings
* Enables [command-line searching](#search)

## Command-Line DuckDuckGo and Google Searches

* Works well with `?` and `??` terminal search functions (see [`rc.bash`](../rc.bash))

## FAQ

*"Why all the `export -f`?"*

Because this effectively turns the functions into commands that behave in just about every way. That means that other programs can call them like commands without concern for sub-shells. For example, I use a lot of `!!` type stuff in `vim` and it requires the functions be exported in order to be used in sub shells (which is what every single '!' command in Vim is). I don't particularly mind it creating all the `BASH_FUNCTION` stuff.

*"What is the difference between 'personal' and 'private'?*

It often makes sense to have three configuration repositories:

1. *Master* configuration (like this one) to share with the world and allow them to use directly. Generally you never change this unless you want anyone else in the world to get your changes. Think of this as your configuration package. When and if you do make changes you consider making a pull request to contribute them.
2. *Personal* configurations that you don't mind keeping public and sharing with the world to give them an example of how you have personalized your configuration. Here's where you keep your own collection of amazing Bash functions that others might want to use. Maybe you maintain your todo list in here or notes you don't mind sharing with others, or YAML version of your resume. It's for everything you cannot communicate in your profile itself. Generally your blog or README will be in their own repo, however.
3. *Private* configurations containing API tokens and such that you don't want to *ever* make public but still need to be saved and have version control. Anything that can be should be strongly encrypted as well when saved into such repos. Never depend on the private setting of the host provider to protect you. One goof by anyone and all your private data is on the Internet. Also remember that anything you ever commit is *always* available if you have not purged your repo since it is in the commit history. If you understand these risks then a private configuration repo can be very practical.

"Why no email (protonmail, mutt) configuration?"

Because not everyone using the terminal needs it. This is a core configuration repo designed for use in schools and by pros and beginners alike to get the main foundation in place, Bash with Vim in TMUX and searching with Lynx. Everyone needs that stuff. Mail is secondary. So is blogging and self publishing. Stay tuned for `config-email` and `config-rwx` to cover those things.

"Why not just use Dropbox?"

Seriously, if you need to ask that you might want to use a computer once in a while that cannot have Dropbox installed. I ran into this on the Interwebz from a guy having trouble with his "zsh and tmux config" (which says all you need to know about his experience).

```sh
# dotfiles

ln -s ~/Dropbox/dotfiles/.bash_profile ~/.bash_profilen
ln -s ~/Dropbox/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Dropbox/dotfiles/.vimrc ~/.vimrc 
```

Just no. Oh my god, no. This configuration makes Bash easier, not dumber.

## Explanations

1. I've never liked calling this conventional repo 'dotfiles' because it is usually more than dotfiles.

2. Using `zsh` is fucking stupid. That's not "just my opinion" it's the objective truth for so many reasons. The biggest is how badly `zsh` hobbles your scripting abilities and power. 80% of the code here uses stuff that will break `zsh`. Fuck POSIX compliance, this is my home directory. The priority is speed. Besides, 70% of the world's UNIX systems are Linux with Bash 4+ on them. So many trade an opportunity to use and master advanced Bash scripting for gawd-awful 'oh-my-zsh' gimmicks. People who use 'oh-my-zsh' are the same short-sighted technologists who map `jk` in Vim command mode to `esc` instead of learning the fully supported `<cntl>-[` alternative to `esc`.

3. Every modern UNIX/Linux system comes with `vi`, not `vim`. No one is ever going to approve a change ticket to make up for your inability to use `vi` because you have been using `vim` incorrectly the whole time. Hell, you won't even be able to add your `.vimrc` to most systems. Never forget.

