# Agent Instructions

## General

- Automatically update this AGENTS.md file when new preferences, conventions, or context are established for this repo

## OpenCode generic queries

- `scripts/ask` (and the `?` alias) always runs from `~/.local/share/ask` so there is one ongoing session
- The standing rules for that session live in `config/opencode/ask/AGENTS.md`, symlinked there by `config/opencode/setup`; edit the repo copy, never the symlink target

## GitHub user and repo location

- Never assume the login name (`$USER`) is the GitHub user or that the repo is under `~/repos/github.com/<user>/dot`
- `config/bash/setup` records `GITUSER` and `DOTFILES` once in `~/.config/dot/env` (machine-local, never committed); `bashrc` sources it and only falls back to `$USER` if it is missing
- The time zone is asked for during `config/bash/setup` (default: previous answer, else the computer's) and stored as `TZ` in that same env file; never hardcode it in `bashrc`
- Author-specific bash settings (aliases, service IDs, `LC_COLLATE`/Go settings, `owncomp`) live in `config/bash/personal`, sourced automatically from `$DOTFILES`; keep `bashrc` generic. Color themes, the prompt, `PATH` and `set -o vi` and `CFLAGS` (both intentional for everyone) stay in `bashrc`
- Scripts and `gh` aliases that need the GitHub owner should ask `gh api user -q .login` or use `$GITUSER`, not `$USER`

## Commits

- Never add `Co-authored-by: Copilot` or any Copilot trailer to commits
- Never add any AI co-authorship trailers to commit messages
