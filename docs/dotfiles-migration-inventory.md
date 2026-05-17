# Dotfiles Migration Baseline Inventory

Generated: 2026-05-17
Host: `Flex-MBP-PBeyer.local`
OS: macOS 26.5 arm64

This is a non-destructive baseline for migrating from Dotbot to chezmoi. It records the current ownership model and classifies each major configuration area before any migration work.

## Repositories

| Path | Current role | Remote | Migration class |
|---|---|---|---|
| `~/Projects/dotfiles` | Main Dotbot source, mostly portable/shared | `pjbeyer.github.com:pjbeyer/dotfiles-v1.git` | Import as portable chezmoi source after cleanup |
| `~/Projects/dotfiles-local` | Local/private Dotbot source | `pjbeyer.github.com:pjbeyer/dotfiles-local-v1.git` | Import as private/encrypted or machine-scoped chezmoi templates |
| `~/.local/share/chezmoi` | New chezmoi source | `pjbeyer.github.com:pjbeyer/dotfiles.git` | Target source repo |

## Current symlink map

```text
/Users/pjbeyer/.bash_profile -> /Users/pjbeyer/Projects/dotfiles/bash_profile
/Users/pjbeyer/.bashrc -> /Users/pjbeyer/Projects/dotfiles/bashrc
/Users/pjbeyer/.profile -> /Users/pjbeyer/Projects/dotfiles/profile
/Users/pjbeyer/.zshenv -> /Users/pjbeyer/Projects/dotfiles/zshenv
/Users/pjbeyer/.zshrc -> (not symlink)
/Users/pjbeyer/.gitconfig -> /Users/pjbeyer/Projects/dotfiles-local/gitconfig
/Users/pjbeyer/.cookiecutterrc -> /Users/pjbeyer/Projects/dotfiles/config/cookiecutter/cookiecutter.yaml
/Users/pjbeyer/.dotfiles -> /Users/pjbeyer/Projects/dotfiles/.
/Users/pjbeyer/.dotfiles_local -> /Users/pjbeyer/Projects/dotfiles-local/
/Users/pjbeyer/.config/bash -> /Users/pjbeyer/Projects/dotfiles/config/bash
/Users/pjbeyer/.config/git -> (not symlink)
/Users/pjbeyer/.config/gnupg -> /Users/pjbeyer/Projects/dotfiles/config/gnupg
/Users/pjbeyer/.config/homebrew -> /Users/pjbeyer/Projects/dotfiles/config/homebrew
/Users/pjbeyer/.config/launchd -> /Users/pjbeyer/Projects/dotfiles/config/launchd
/Users/pjbeyer/.config/macos -> /Users/pjbeyer/Projects/dotfiles/config/macos
/Users/pjbeyer/.config/ruff -> /Users/pjbeyer/Projects/dotfiles/config/ruff
/Users/pjbeyer/.config/shell -> /Users/pjbeyer/Projects/dotfiles/config/shell
/Users/pjbeyer/.config/uv -> /Users/pjbeyer/Projects/dotfiles/config/uv
/Users/pjbeyer/.config/zsh -> /Users/pjbeyer/Projects/dotfiles/config/zsh
/Users/pjbeyer/.config/local -> /Users/pjbeyer/Projects/dotfiles-local/config/local
/Users/pjbeyer/.config/gem -> (not symlink)
/Users/pjbeyer/.ssh/config -> /Users/pjbeyer/Projects/dotfiles-local/ssh/config
/Users/pjbeyer/.ssh/config.d -> /Users/pjbeyer/Projects/dotfiles-local/ssh/config.d
/Users/pjbeyer/.ssh/known_hosts.d -> /Users/pjbeyer/Projects/dotfiles-local/ssh/known_hosts.d
/Users/pjbeyer/.ssh/rc -> /Users/pjbeyer/Projects/dotfiles-local/ssh/rc
/Users/pjbeyer/Library/LaunchAgents/environment.plist -> /Users/pjbeyer/Projects/dotfiles/config/launchd/agents/environment.plist
```

## Repository state at baseline

### Main dotfiles

```text
## main...origin/main
 M bashrc
 M config/git/ignore
 M config/zsh/.zshrc
 M zshenv
?? config/shell/plugins/claude-mem.sh
?? config/zsh/functions/

 bashrc            |  2 ++
 config/git/ignore | 13 +++++++++++++
 config/zsh/.zshrc |  6 ++++++
 zshenv            |  7 +++++--
 4 files changed, 26 insertions(+), 2 deletions(-)
```

### Local dotfiles

```text
## flex-mbp-pbeyer...origin/flex-mbp-pbeyer
 M gitconfig
 M ssh/config.d/arda.conf
 M ssh/config.d/github.conf
 M ssh/known_hosts.d/arda

 gitconfig                | 63 +++++++++++++++++++++++++++++++++++++++++++-----
 ssh/config.d/arda.conf   | 40 +++++++++++++++++++++++++++++-
 ssh/config.d/github.conf |  8 +++---
 ssh/known_hosts.d/arda   |  4 +--
 4 files changed, 102 insertions(+), 13 deletions(-)
```

### Chezmoi source

```text
## No commits yet on main
?? .chezmoiignore
?? key.txt.age
?? run_onchange_before_decrypt-private-key.sh.tmpl

 R decrypt-private-key.sh
```

## Migration classification

| Current path | Source | Classification | Proposed chezmoi path/pattern | Notes |
|---|---|---|---|---|
| `~/.zshenv` | `~/Projects/dotfiles/zshenv` | portable template | `dot_zshenv.tmpl` | Template Homebrew prefix and XDG setup. Keep tiny and robust. |
| `~/.config/zsh/.zshrc` | main | portable | `dot_config/zsh/dot_zshrc.tmpl` | Preserve `ZDOTDIR`; consider replacing Antigen later, but do not combine with migration. |
| `~/.config/zsh/settings.zsh` | main | portable | `dot_config/zsh/settings.zsh.tmpl` | OS-specific plugin blocks already exist. |
| `~/.config/zsh/functions/` | main, untracked | portable/manual review | `dot_config/zsh/functions/` | Review before import because currently untracked. |
| `~/.bashrc` | main | portable | `dot_bashrc.tmpl` | Template Homebrew prefix consistently with zsh/profile. |
| `~/.bash_profile` | main | portable | `dot_bash_profile` | Likely simple entrypoint. |
| `~/.profile` | main | portable | `dot_profile.tmpl` | Shell-neutral XDG/path setup. |
| `~/.config/shell/environment.sh` | main | portable | `dot_config/shell/environment.sh.tmpl` | Central XDG/env definitions. Add only safe env vars first. |
| `~/.config/shell/path.sh` | main | portable | `dot_config/shell/path.sh.tmpl` | Keep short; avoid host-specific paths except via templates. |
| `~/.config/shell/functions.sh` | main | portable | `dot_config/shell/functions.sh` | Pure functions, safe to import. |
| `~/.config/shell/plugins/claude-mem.sh` | main, untracked | review | `dot_config/shell/plugins/claude-mem.sh` or ignore | Import only if not machine/generated. |
| `~/.gitconfig` | local | private/persona template | `dot_gitconfig.tmpl` | Preserve includeIf logic; template home path and account contexts. |
| `~/.config/git/config*` | live/local | private/persona template | `dot_config/git/config*.tmpl` | Currently `.config/git` itself is not a symlink; files appear managed via local repo intent. |
| `~/.config/git/ignore` | main | portable | `dot_config/git/ignore` | Current main repo has local modifications; import after review. |
| `~/.ssh/config` | local | private template | `private_dot_ssh/config.tmpl` | Template includes; avoid secrets. |
| `~/.ssh/config.d/` | local | private template | `private_dot_ssh/config.d/` | Current dirty changes; review before import. |
| `~/.ssh/known_hosts.d/` | local | local/state-ish | maybe ignore or private | Known hosts change often; consider not managing except curated entries. |
| `~/.ssh/rc` | local | private/portable | `private_dot_ssh/rc` | Review content before import. |
| `~/.config/homebrew` | main | portable + host templates | `dot_config/homebrew/` | Existing Brewfiles already split by domain and host. Strong chezmoi fit. |
| `~/.config/ruff` | main | portable | `dot_config/ruff/` | Safe early import. |
| `~/.config/uv` | main | portable | `dot_config/uv/` | Safe early import. |
| `~/.config/cookiecutter` / `~/.cookiecutterrc` | main | portable | `dot_cookiecutterrc` or `dot_config/cookiecutter/` | Decide whether to preserve legacy symlink. |
| `~/.config/launchd` | main | macOS-only | `dot_config/launchd/` plus run scripts | Manage authored agents only. Do not import vendor LaunchAgents wholesale. |
| `~/Library/LaunchAgents/environment.plist` | main | macOS-only link | `Library/LaunchAgents/environment.plist.tmpl` | Template username/home path if needed. |
| `~/.config/macos` | main submodule | macOS-only scripts | `dot_config/macos/` or external reference | Review submodule value before import; maybe replace with focused scripts. |
| `~/.config/gnupg` | main | sensitive/stateful | defer | Do not blindly import keyrings, trustdb, sockets, lock files. Manage only static config (`gpg.conf`, `gpg-agent.conf`, `dirmngr.conf`) if desired. |
| `~/.config/1Password` | local/live | private/tool config | defer/private | Some files are generated or sensitive. Use explicit allowlist. |
| `~/.config/op` | live | private/tool config | defer/private | Use explicit allowlist; prefer 1Password/keychain bootstrap convention. |
| `~/.config/opencode` | live | mixed generated + curated | defer/allowlist | Many backups/node_modules/local files. Do not import wholesale. |
| `~/.config/claude` | live | mixed curated/private | defer/allowlist | MCP profiles may include secrets/paths. Review and template. |
| `~/.config/wezterm` | live | portable app config | import after review | Likely good candidate once source ownership decided. |
| `~/.config/yazi` | live | portable app config | import after review | Likely good candidate. |
| `~/.config/direnv` | live | portable/private mix | import after review | Check for secrets before import. |
| `~/.npmrc` | live | potentially sensitive | defer/template | May contain auth or registry config. Redact/review. |
| `~/.zshrc` | live unmanaged | drift | remove or absorb | Currently only adds `.npm-global/bin`; should move into XDG path logic if needed. |
| shell histories / `.zwc` / `.DS_Store` | generated | ignore | `.chezmoiignore` | Never manage. |

## Principles for this migration

1. Migrate in small verified waves: shell, git, low-risk XDG configs, package manifests, macOS settings, then sensitive/private tools.
2. Prefer templates over duplicated host files.
3. Preserve public/private intent using `private_`, encryption, and `.chezmoiignore`; do not blindly copy `dotfiles-local`.
4. Keep `~/.zshenv` minimal; most complexity belongs in `~/.config/shell` and `~/.config/zsh`.
5. Separate desired state from observed app state. App-generated plists, backups, caches, histories, sockets, and keyrings are not dotfiles.
