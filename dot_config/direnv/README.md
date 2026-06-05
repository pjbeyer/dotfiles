# direnv HOME-root environment layout

This directory contains the shared `direnv` helper used by Phil's HOME-root environment scopes.

## Helper contract

- `use pjb_env` loads the current directory's `.env` and resolves any `op://` references through `use_sourceop`.
- `use pjb_env up` first sources the nearest parent `.envrc`, then loads the current directory's `.env` and resolves `op://` references.
- `use_sourceop` groups `op://` references by owning 1Password account before running `op inject`, so mixed personal/work env collections do not rely on whichever account `op` happens to select by default.

## Managed scopes

The checked-in source intentionally manages these first-class HOME roots separately:

- `~/Projects`
- `~/Projects/pjbeyer`
- `~/Projects/work`
- `~/.config`
- `~/Demonstrations`
- `~/Demonstrations/work`

Each scope has a small `.envrc` and a private `.env` containing 1Password-backed references, not literal secret values.

## Boundary rules

- Do not add a global `$HOME/.envrc`; broad HOME loading would expose credentials too widely.
- Keep `~/Demonstrations` separate from `~/Projects`; demos may share some aliases but have different artifact and presentation boundaries.
- Keep work/Flex-only credentials scoped to the work roots.
- Keep literal secret values out of this repo; use `op://` references or other approved secret stores.
