# Agent Instructions

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
- All Twitch tooling (`bin/twitch-*` and other Twitch bits) is to be replaced by nomadirl; leave it in place until nomadirl is installed and working

## Commits

- Never add `Co-authored-by: Copilot` or any Copilot trailer to commits
- Never add any AI co-authorship trailers to commit messages
