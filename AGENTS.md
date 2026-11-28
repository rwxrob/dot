# Agent instructions

## General

- Automatically update this AGENTS.md file when new preferences, conventions, or context are established for this repo

## OpenCode generic queries

- `bin/ask` (and the `?` alias) always runs from `~/.local/share/ask` so there is one ongoing session
- The standing rules for that session live in `config/opencode/ask/AGENTS.md`, symlinked there by `config/opencode/setup`; edit the repo copy, never the symlink target

## GitHub user and repo location

- Never assume the login name (`$USER`) is the GitHub user or that the repo is under `~/repos/github.com/<user>/dot`
- `config/bash/setup` records `GITUSER` and `DOTFILES` once in `~/.config/dot/env` (machine-local, never committed); `bashrc` sources it and only falls back to `$USER` if it is missing
- The time zone is asked for during `config/bash/setup` (default: previous answer, else the computer's) and stored as `TZ` in that same env file; never hardcode it in `bashrc`
- Author-specific bash settings (aliases, service IDs, `owncomp`) live in `config/bash/personal`, sourced automatically from `$DOTFILES`; keep `bashrc` generic. Color themes, the prompt, `PATH` and `set -o vi`, `CFLAGS`, `LC_COLLATE` and the Go settings (all intentional for everyone) stay in `bashrc`
- Git `user.name` and `user.email` are personal: `config/git/setup` asks for them (defaults: previous answer, then GitHub via `gh`) and writes them to the untracked `~/.gitconfig`; never commit an identity to the repo. `gh`'s `config.yml` has no identity settings
- Commit signing is SSH-based and configured per machine by `config/git/setup` (finds `~/.ssh/id_*.pub`, writes `user.signingkey`, `gpg.format`, `commit.gpgsign` and an `allowed_signers` file); it merges into an existing `~/.gitconfig` and only fills in missing keys, so working signing and deliberate choices are never overwritten; never hardcode a key path in the repo or commit a private key. Anything that changes keys or GitHub (create key, add passphrase, register signing key) only happens after a yes at a terminal
- There is no `SCRIPTS` variable: `bashrc` puts `$DOTFILES/bin` on `PATH`, and scripts that need their own directory (like `newx`) find it with `realpath "$0"`; never reintroduce `$SCRIPTS` or depend on `~/Scripts`
- Scripts and `gh` aliases that need the GitHub owner should ask `gh api user -q .login` or use `$GITUSER`, not `$USER`

## Pruning

- Prune conservatively: move retired scripts to `bin/deprecated/` (off `PATH`) instead of deleting them, and remove their rows from `bin/README.md`
- The Twitch scripts are retired; nomadirl replaces them, so do not add Twitch tooling back

## Checks and repo rules

- Run `./check` before committing; it must pass (syntax, `shellcheck` errors, `rumdl`, and the rules it enforces). `git add` new files first, since it only sees what git knows about
- Never use `CDPATH`; `cdd` in `config/bash/bashrc` (roots in `$CDD`) does that job without changing plain `cd`
- Paths use lowercase `repos`, never `Repos` (macOS ignores the difference, Linux does not)
- `bin/open` shadows the system `open`, so it must stay a drop-in: every option and path passes straight through
- Use `#!/usr/bin/env bash` (`/usr/bin/bash` does not exist on macOS)
- In Perl, write `` `command -v NAME 2>/dev/null` ``: without the redirect Perl runs it with no shell, which fails on Linux because `command` is a builtin
- CPAN modules go in `~/perl5` (never `sudo cpan`); what `fishies` needs is installed by `install/{ubuntu,mac}/install-fishies`
- Every script in `bin/` is executable and has exactly one row in `bin/README.md`
- Lint and format Markdown with `rumdl` (config in `config/vim/rumdl.toml`)

## WSL

- `config/wsl/setup` acts only on WSL2 (`WSL2` in `/proc/sys/kernel/osrelease`) and silently does nothing elsewhere, including WSL1; do not loosen this to a `microsoft` match
- `config/wsl/wslconfig` is the source for `%USERPROFILE%\.wslconfig`; `config/wsl/setup` copies it (never a link; a differing file is backed up first), so keep any host settings worth keeping in the repo copy
- Setup never runs `wsl --shutdown`; it stops every running distribution, so leave that to the person at the keyboard

## WezTerm

- Under WSL, WezTerm is the Windows program: `config/wezterm/setup` copies `wezterm.lua` to `%USERPROFILE%\.wezterm.lua` (never a link into WSL; a differing file is backed up first) and installs missing fonts on the Windows host for the current user only, without administrator rights; rerun it after editing `wezterm.lua`
- One `wezterm.lua` serves every OS; guard OS-specific settings (shell path, window position) with `wezterm.target_triple`

## Streaming and clips

- Clips are always portrait with two regions: my face on top and the relevant section of the screen on the bottom; judge terminal font size and OBS layout for phone readability with that in mind

## Commits

- Never add `Co-authored-by: Copilot` or any Copilot trailer to commits
- Never add any AI co-authorship trailers to commit messages
