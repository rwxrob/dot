# Agent Instructions

## General

- Automatically update this AGENTS.md file when new preferences, conventions, or context are established for this repo

## OpenCode generic queries

- `scripts/ask` (and the `?` alias) always runs from `~/.local/share/ask` so there is one ongoing session
- The standing rules for that session live in `config/opencode/ask/AGENTS.md`, symlinked there by `config/opencode/setup`; edit the repo copy, never the symlink target

## Commits

- Never add `Co-authored-by: Copilot` or any Copilot trailer to commits
- Never add any AI co-authorship trailers to commit messages
