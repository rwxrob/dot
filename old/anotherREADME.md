# System Configuration and Script Library

![WIP](https://img.shields.io/badge/status-wip-red)

Pilfer at your own risk, for now.

## When to Use What?

* **Aliases** when never run from anything but an interactive shell.
* **Exported function** when not using anywhere but Bash.
* **POSIX script** when want to share the most or run from *anything*.
* **Bash script** when more than POSIX is required but not enough to compile.
* **Node script** when JSON manipulation or web-centric operations required.
* **Python script** when automation, ML, or math-intensive operations required.
* **Go program** when compilation is required. 
* **Rust program** when compilation without garbage collection is required. 
* **C program** when finely tuned, low-level compilation is required.
* **Assembly code** when ultra low-level compilation is required.

## Design Guidelines

* Nothing in any shell configuration file (`bashrc`) should ever depend on anything in the `scripts` or `bin` directories in order to keep them portable.

* Anything in scripts can use another script but should not be dependent on any specific shell configuration.

## Do you need to change directories or set environment variables?

If so you probably want an exported Bash function. It is impossible to change directories and have it stick with *anything* other than an exported Bash function. This is because every subprocess receives its own environment and current working directory. For security reasons subprocesses can *never* affect their parents in any way. This holds true for setting environment variables in the parent process as well. It's impossible (and never will be possible).

Note that this is one *major* advantage of Bash over *every other shell* --- especially Zsh. Used responsibly it objectively provides the most powerful solutions and options to command line users and developers. No other Unix/Linux shell currently in existence has this.
# Easy Bash Terminal Master Configuration

![WIP](https://img.shields.io/badge/status-wip-red)

## Install

Easiest is to just pull the file down directly (for most things):

```bash
https://gitlab.com/rwxrob/config/-/raw/master/bashrc >| ~/.bashrc
```

You really don't need to save the old `~/.bashrc` since you can always get it from `/etc/skel/.bashrc` if something goes wrong.

However, if you want all the `~/bin` scripts as well you might just want to clone the repo and run `setup.sh`.

Or you can just steal stuff from it. It's all public domain (no licensing required).

## Aliases, Functions, and Scripts (Oh My)

Picking between aliases, exported functions, and scripts is a big decision when creating your own Bash configuration. Here's my thinking about it:

* **Aliases.** Aliases cannot be used anywhere but the interactive command shell, so no calling them from within Vi, for example. As the Bash Manual page says, "For almost every purpose, aliases are superseded by shell functions."

* **Exported Functions.** Bash allows for exported functions with `export -f myfunc` so that they can be used from subprocesses provided bash is being used. So any exported function can be used from Vi, for example. Because of their dependency on Bash I consider these *Bash extensions* for all intents and purposes. They *cannot* be called from `exec()` in any other language.

* **POSIX Scripts.** POSIX scripts (`/bin/sh -> /bin/dash`) are the next level of functionality. The logic is why use more than POSIX unless it is needed. All scripts go into `~/bin/`. Scripts work with all `exec()` calls from any other application or language (such as for integration with TMUX).

* **Bash Scripts.** Bash 4+ provides a lot of additional power --- including regular expressions, parameter expansion, arrays and associative arrays --- and can easily be added to a POSIX script to increase its possibilities just by changing `/bin/sh` to `/bin/bash`.  This is the least amount of effort when boosting a script (while remaining just a script).

* **Other Specialized Interpreters.** Sometimes you need more than Bash but want to stay with a script --- although this is become *far* less common. (Personally I rarely need this since either Bash or Go almost always covers the need batter.) In these rare cases you want an interpreted language like Python, Ruby, Perl, Node/Deno, even TCL. (In the field of cybersecurity knowing how to *read* these languages is still critical.) Examples of niche requirements are machine learning and Cuda with Python, or Perl on a compromised system when it is the most powerful interpreter available on everything, or Node when I need to port from one JSON file structure to another.

* **Go Programs.** Usually when a Bash script isn't enough the first thing to reach for is a cross-compilable, multi-purpose language that has weight, strict-typing, and wicked simple and strong concurrency. Go can be used for very simply utilities that will run on *anything* without any additional interpreter installation and anything written in it can grow into a full-size, enterprise application (and has been by thousands, including Docker itself) making it the most sustainable, multi-purpose, C-compatible language.

* **Rust Programs.** When Go's garbage collection gets in the way, or when absolutely 100% memory safe, highly performant applications are required there's nothing better than Rust currently. Alacritty is the fastest terminal on Earth, for example. Rust is now being used to replace C++ and even some C applications and multiple major companies have announced their next version of their software will be ported to Rust.

* **C Programs.** C is the base universal, low-level language. It's dominance in the industry is undisputed. All major, successful languages and operating systems have been written in it (and no not in C++). It is mandatory for systems development including embedded systems (IoT). It can easily be combined into Go and Rust, and can be quickly stubbed in Python.

* **Assembler.** The only other language is Assembler for the target chips involved. This is mandatory for pentesting, malware development, and forensics. Learning it helps understand how *digital* computers fundamentally work.

----

*This is all left over and being rewritten. Ignore.*
*Currently in the process of migrating comments into this `README.md`.*

This is a universal home configuration setup for anyone wishing to use Bash wherever it may be found, but mostly Linux. It is designed to be used as-is and extended through `.bash_personal` and/or `.bash_private` but could equally provide ideas for your own. The primary motivation for creating this configuration is to simplify common tasks associated with true Bash terminal mastery including editing, screen management, dealing with Git repos, command-line searching, and more. It is particularly easy for absolute beginners to Bash as they get used to working more and more only from the command line and ween themselves off of dependency on graphic user interfaces.

* **Clone it** if you just want to use it as-is for now so you can keep up with the latest. (You don't even need a GitHub account, but you should probably get one anyone) 

```
cd
mkdir repos
cd repos
git clone https://github.com/rwxrob/config
cd config
. setup
```

* **Fork it** if you want to maintain your own changes or possibly submit improvements as pull requests. (You know what to do.)

* **Pilfer it** if you know what you are doing, or prefer to study each individual thing and evaluate if and how you would use it. This is a good Bash learning exercise.

## Command Functions and Aliases

A *command function* is a function that is exported from a `.bashrc` (or similar) file on startup and is therefore available in every way that an executable compiled binary or script command is. When using this home configuration (or adding to your own) you can use these command functions as if they were extensions to the commands available on the system.

Command functions have the advantage of being compiled once at login and never needing to be parsed or compiled ever again giving them the title of fastest executable on a given shell (that's startup time, not overall run time).

### `anotherterminal`

### `aliasesin`

Dumps all the alias lines from a file. Useful mostly for creating documentation about the aliases.

### `ansicolors`

### `argsorin`

### `asciijoin`

### `backsoon`

Prints "be back soon" ASCII art with random color.

```
     | |                
     | |__   ___        
  _  | '_ \ / _ \  _    
 | | | |_) |  __/ | |   
 | |_|_.__/ \___|_| | __
 | '_ \ / _` |/ __| |/ /
 | |_) | (_| | (__|   < 
 |____/_\__,_|\___|_|__\
 / __|/ _ \ / _ \| '_ \ 
 \__ \ (_) | (_) | | | |
 |___/\___/ \___/|_| |_|

```

### `basepart`

### `cdusb`

### `change-user-name`

### `cheat`

### `chsuffix`

### `clear`

The `/usr/bin/clear` command is an unnecessary subshell for clearing the screen on most modern terminals because they support sending the clear escape character (`\033[H\033[2J`). Printing a few characters is far more efficient than forking an entire subshell. 

### `confirm`

### `danger`

### `dangerln`

### `dirpart`

### `doh`

Prints Homer (from Simpsons) saying "DOH!".

```

                 _ ,___,-'",-=-.           
       __,-- _ _,-'_)_  (""`'-._\ `.    _____   ____ _    _ _ 
    _,'  __ |,' ,-' __)  ,-     /. |   |  __ \ / __ \| |  | | |
  ,'_,--'   |     -'  _)/         `\   | |  | | |  | | |__| | |
,','      ,'       ,-'_,`           :  | |  | | |  | |  __  | |
,'     ,-'       ,(,-(              :  | |__| | |__| | |  | |_|
     ,'       ,-' ,    _            ;  |_____/ \____/|_|  |_(_)
    /        ,-._/`---'            /                                
   /        (____)(----. )       ,'                                 
  /         (      `.__,     /\ /,         
 :           ;-.___         /__\/|         
 |         ,'      `--.      -,\ |         
 :        /            \    .__/           
  \      (__            \    |_            
   \       ,`-, *       /   _|,\           
    \    ,'   `-.     ,'_,-'    \          
   (_\,-'    ,'\")--,'-'       __\         
    \       /  // ,'|      ,--'  `-.       
     `-.    `-/ \'  |   _,'         `.     
        `-._ /      `--'/             \    
          ,'           |              \    
          /             |               \  
       ,-'              |               /  
      /                 |             -'   

```

### `duck`

### `echon`

### `eject`

### `ex`

### `firstline`

### `funcsin`

### `gh`

### `gocd`

### `godistbuild`

### `google`

### `gott`

### `grepall`

### `havecmd`

### `hrule`

Prints a horizontal rule that is 74 columns is still the safest width for most terminals especially considering Vim with line numbering chews up five of them. If an argument is passed it will simply be repeated 74 times. Override in `~/.bash_{personal,private}` to change for all but keep it even. If you do change it don't forget to `set textwidth=<your>` in `vimrc` as well.

### `htitle`

Encapsulates the combined text of all the arguments (or first line of standard input) into a 74 character header with hashtags (`#`).

```
############################### Some Title ###############################
```

### `httphead`

### `humm`

Prints Homer (from Simpsons) saying "Humm."

```
       ,---.                        
     ,.'-.   \                      
    ( ( ,'"""""-.                   
    `,X          `.          _____                   
    /` `           `._      |  |  |_ _ _____ _____   
   (            ,   ,_\     |     | | |     |     |_ 
   |          ,---.,'o `.   |__|__|___|_|_|_|_|_|_|_|
   |         / o   \     )          
    \ ,.    (      .____,           
     \| \    \____,'     \          
   '`'\  \        _,____,'          
   \  ,--      ,-'     \            
     ( C     ,'         \           
      `--'  .'           |          
        |   |            |          
      __|    \        ,-'_          
     / `L     `._  _,'  ' `.        
    /    `--.._  `',.   _\  `       
    `-.       /\  | `. ( ,\  \      
   _/  `-._  /  \ |--'  (     \     
 -'  `-.   `'    \/\`.   `.    )    
        \           \ `.  |    |    

```

### `huzzah`

Prints blinking ASCII art "Huzzah!"

```
    _   _                    _     _ 
   | | | |_   _ __________ _| |__ | |
   | |_| | | | |_  /_  / _` | '_ \| |
   |  _  | |_| |/ / / / (_| | | | |_|
   |_| |_|\__,_/___/___\__,_|_| |_(_)
                                     
```

### `isbase`

### `isbgbase`

### `isbgcolor`

### `iscolor`

### `issol`

### `is-valid-username`

### `kat`

### `katlines`

### `lastdown`

### `lastpic`

### `lastpreserved`

### `linecount`

### `listening`

### `lower`

### `lspreserved`

### `lynx`

### `mark`

### `mktempdir`

### `mktempfile`

### `mktempname`

### `mktemppath`

### `monitor`

### `monitor-once`

### `month`

### `mvlast`

### `mvlastpic`

### `newest`

### `now`

### `onlinux`

### `onmac`

### `onunknown`

### `onwin`

### `perg`

### `preserve`

### `preview`

### `remind`

### `remindln`

### `repo`

Repo is command function with subcommands related to dealing with Git repositories. When given no subcommand argument it simply changes into the `$REPOS` directory. If given an argument will read the first argument and pass it to `match` to look for match. If one match is found will change into it. If more than one is found will prompt for which to change into. Fails silently if there is no `$REPOS` environment variable set.

#### `discover`

Descends into the `$REPOS` directory and finds all the Git repos returning their relative paths. Normally you don't need discover because it is just to actually do the discovery that gets saved into the `MANIFEST` when `mkmanifest` is called.

#### `in`

Returns unary true or false if executed from anywhere within the `$REPO` directory of any of its subdirectories.

#### `list`

Simply lists all the repos using their relative paths within then `$REPOS` directory.

#### `match`

Returns the relative paths of any repo containing the keyword or regular expression passed as the first (and only) argument.

#### `mkmanifest`

Generates the `MANIFEST` file within the `$REPOS` directory for faster searching and iterating. It is called automatically whenever another subcommand is called that adds, moves, or deletes a repo but can be called explicitly if there is any question about it being in sync.

#### `paths`

Same as `list` put prints the full paths rather than relative.

### `rmpreserved`

### `rnd`

### `save`

### `sols`

### `sshhosts`

### `sshkeygen`

### `sshpubkey`

### `stringscan`

### `sudolistening`

### `symlink`

### `tell`

### `telln`

### `token`

### `trash`

### `tstamp`

### `tstampfile`

### `unpreserve`

### `upper`

### `urlencode`

### `usageln`

### `usb`

### `vic`

### `warn`

### `warnln`

### `watch`

### `weekday`

### `year`

### `zeroblk`

## Aliases


