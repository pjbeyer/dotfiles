# Dotfiles Specification Roadmap

This roadmap decomposes the dotfiles vision into SpecKit-style specifications that can be written and implemented incrementally.

## Proposed specs

### 001-constitution-and-taxonomy

Define the constitution, path classification taxonomy, review gates, and documentation contract.

Acceptance criteria:
- Constitution committed.
- Inventory table has a required classification column.
- Every future spec names classifications and validation commands.

### 002-chezmoi-source-layout

Define the canonical chezmoi directory layout, naming conventions, `.chezmoiignore`, template conventions, and source-only docs policy.

Acceptance criteria:
- Source tree has stable top-level organization.
- Generated-state ignore rules cover known histories/caches/vendor outputs.
- `chezmoi doctor` and source lint pass.

### 003-host-profile-data-model

Define OS/arch/hostname/persona/profile data, how private host data is supplied, and how Linux/macOS differences are expressed.

Acceptance criteria:
- Host profile examples exist for macOS work laptop, macOS personal machine, and Linux server/workstation.
- Templates avoid hard-coded `/Users/pjbeyer` except through `.chezmoi.homeDir`.

### 004-shell-and-xdg-foundation

Finalize zsh/bash/profile/XDG/path/function architecture and eliminate legacy drift such as unmanaged `~/.zshrc` behavior.

Acceptance criteria:
- Rendered shell files pass `zsh -n`/`bash -n`.
- Login and non-login shell behavior is documented.
- Path/env ownership is centralized.

### 005-git-personas-and-repository-routing

Define Git identity/includeIf rules, work/personal/play separation, GitHub host alias semantics, signing, ignores, and credential-helper expectations.

Acceptance criteria:
- Rendered git configs parse.
- Test matrix covers representative work/personal/play paths.
- No company-facing docs leak local issue IDs by default.

### 006-homebrew-and-package-orchestration

Define how chezmoi manages Homebrew env/plugin/bootstrap while preserving `homebrew-brewfile` as the Brewfile source of truth.

Acceptance criteria:
- Chezmoi manages `brew.env`, `.Brewfile` pointer, and shell integration only.
- Brewfile repo ownership is documented as `external-source`.
- Any install/update commands are dry-run/manual by default.

### 007-private-secrets-and-encryption

Define 1Password, macOS Keychain, age, and chezmoi-native encryption strategy for secrets/private values.

Acceptance criteria:
- Clear rules for plaintext vs encrypted vs runtime retrieval.
- Bootstrap token preference matches current user preference.
- Secret scanning checklist exists before commits.

### 008-ai-coding-agent-configs

Allowlist and migrate Hermes, Claude, OpenCode, Codex, Gemini, Goose, MCP, and related agent context/config files safely.

Acceptance criteria:
- Each tool has an import decision: manage, encrypted/template, external, generated, or ignore.
- Node/vendor directories, sessions, backups, account state, and caches are excluded.
- MCP/server secrets are templated/encrypted or retrieved from 1Password.

### 009-ssh-and-1password-agent

Migrate SSH routing and 1Password SSH agent config without importing private keys or volatile known_hosts state.

Acceptance criteria:
- `ssh -G github.com` and `ssh -G work.github.com` parse successfully.
- Private key files remain unmanaged.
- Known-hosts policy is explicit.

### 010-macos-defaults-and-launchagents

Define macOS defaults, hand-authored LaunchAgents, reload behavior, and app-generated preference boundaries.

Acceptance criteria:
- Only authored LaunchAgents are managed.
- Defaults script is idempotent and reviewable.
- No vendor LaunchAgents imported wholesale.

### 011-terminal-editor-file-manager-apps

Define active app configs such as Yazi and future terminal/editor tooling; explicitly exclude obsolete apps like WezTerm.

Acceptance criteria:
- Active app allowlist exists.
- Generated plugin/vendor directories are excluded or bootstrapped.
- Obsolete app configs are marked `do-not-manage`.

### 012-linux-portability-and-bootstrap

Define how the same chezmoi repo initializes Linux systems with appropriate package managers, shell behavior, and headless constraints.

Acceptance criteria:
- Linux bootstrap path documented.
- macOS-only assets guarded.
- No Darwin assumptions leak into Linux renders.

### 013-apply-rollback-and-drift-control

Define how changes are previewed, applied, rolled back, and audited across systems.

Acceptance criteria:
- `chezmoi diff` review gates are explicit.
- Rollback uses git revisions and backups.
- Drift review cadence exists.
