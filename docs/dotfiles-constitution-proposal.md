# Dotfiles SpecKit Constitution Proposal

Status: Proposed
Owner: Phil Beyer
Scope: `~/.local/share/chezmoi` and the broader workstation-configuration ecosystem it orchestrates.

## Mission

Create a simple, elegant, powerful, portable, and alignment-enforced configuration system for Phil's macOS and Linux systems. Chezmoi is the primary source of truth for desired user configuration; external specialist repositories remain source-of-truth only when deliberately delegated.

## Articles

### I. Baseline before mutation

Every material change starts from observed state: source repo, live target, ownership, symlink status, generated/private/local classification, and validation path. No broad `chezmoi apply`, package install, defaults write, or service reload happens without an explicit review point.

### II. One desired-state model, many host profiles

The repository must model intent once and vary by OS, architecture, host, and persona through templates/data. Duplicate host files are allowed only when that duplication is clearer than templating.

### III. Public, private, local, generated: always separate

Each managed path has a classification:

- `portable-public`: safe to manage plainly.
- `portable-private`: reusable but sensitive; encrypt or template from a secure source.
- `host-local`: machine-specific; template with local data or keep out.
- `generated-state`: cache/history/session/vendor output; never source-of-truth.
- `external-source`: intentionally delegated to another repo/tool.
- `do-not-manage`: obsolete or fragile.

### IV. XDG-first, compatibility-aware

Prefer XDG-compliant locations when choosing new homes. Do not break existing tools merely to satisfy purity; migrate compatibility in stages with verification.

### V. Secrets never leak

Secrets, tokens, private keys, account state, and sensitive host data must not be committed in plaintext. Preferred order: 1Password/keychain retrieval, chezmoi-native encryption, private templates, then local unmanaged files.

### VI. Package management is orchestrated, not absorbed

Chezmoi may manage package-manager configuration, bootstrap scripts, and pointers. The `homebrew-brewfile` repository remains the Brewfile collection source of truth unless explicitly changed. No automatic package mutation runs without an approved spec and dry-run output.

### VII. AI/coding-agent context is first-class but guarded

Coding agent and GenAI configuration/context files are important desired state. They require allowlist review, generated-state exclusion, and encryption/templates before import.

### VIII. Minimal entrypoints, composable libraries

Shell entrypoints stay tiny. Shared behavior lives in XDG config libraries by concern: environment, path, functions, plugins, Git, package managers, agent tooling.

### IX. Validation is part of every change

Every import/spec has explicit validation: template rendering, syntax checks, `chezmoi diff/status`, tool-specific checks, and git clean state. Validation failures block apply.

### X. Documentation is executable alignment

Inventory, decisions, specs, and implementation plans are not commentary; they define enforcement. If behavior changes, docs/specs change in the same commit.

## Governance

- Changes that alter active target files require an apply plan with rollback.
- Specs must identify affected paths, classification, validation, and safety gates.
- External-source boundaries must be named explicitly.
- Obsolete app configs should be excluded rather than polished.
- This constitution supersedes legacy Dotbot structure when there is conflict.
