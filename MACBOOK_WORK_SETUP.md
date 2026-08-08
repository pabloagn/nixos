# MacBook Pro Work Setup

This is a focused setup plan for an employer-owned macOS work laptop. It is not a NixOS port, not a mirror of every Rhodium package, and not a personal media workstation.

The goal is to preserve the parts of Rhodium that materially improve daily engineering work: shell ergonomics, fast terminal navigation, Git tooling, a small AI-agent layer, four language ecosystems, keyboard-driven window organization, and reproducible dotfiles.

## Ground Rules

- Company security policy, MDM, approved software, VPN, SSO, and endpoint tooling take precedence over this document.
- Homebrew manages command-line utilities. It is not used here as a substitute for the Mac App Store or every vendor's native application installer.
- Native macOS applications should come from the company portal or official vendor website unless the company explicitly standardizes Homebrew casks.
- Language dependencies belong to projects. Avoid a huge global Python, Go, or SQL toolchain.
- Install one tool per responsibility. Do not install competing launchers, window managers, clipboard managers, or container runtimes without a concrete reason.
- Personal entertainment, music production, graphics, torrenting, and home-server clients are out of scope.

## Corrected Names

- `commitizewn` means `commitizen`.
- `rigrep` means `ripgrep`.
- Nix's `awscli2` package corresponds to AWS CLI v2; Homebrew calls its formula `awscli`.
- Nix's `delta` package is installed by Homebrew as `git-delta` but the executable remains `delta`.

## Installation Model

| Kind | Installation method | What belongs there |
| --- | --- | --- |
| Built into macOS | Keep the Apple-provided command | `zsh`, `curl`, `zip`, `unzip` |
| CLI utilities | Homebrew formulae | Shells, Git/TUI tools, search, text/data tools |
| Terminal applications | Official download or company-approved cask | Ghostty, Kitty |
| macOS productivity apps | Company portal or official website | Karabiner-Elements, Raycast, AeroSpace, Hammerspoon |
| Container runtime | Company-approved native application | Docker Desktop; OrbStack only if approved |
| AI coding agents | Official vendor installer or approved Homebrew release | Codex, Gemini CLI, Claude Code |
| Language tooling | Homebrew plus project-local managers | Python, Go, SQL, Nix tooling |
| Work applications | Company portal / MDM | Browser, chat, meetings, office suite, VPN, password manager |

## Phase 1: Base macOS Setup

Before installing anything:

1. Complete company enrollment, FileVault, SSO, security tooling, VPN, certificates, and software updates.
2. Confirm whether Homebrew, Docker Desktop, AI coding agents, browser extensions, and keyboard accessibility tools are permitted.
3. Install Apple's command-line developer tools:

```bash
xcode-select --install
```

4. Install Homebrew from its official site or the employer's managed package. Do not pipe an installer into a shell if company policy provides a signed PKG or managed deployment.

## Phase 2: Rhodium CLI Core

### Already Supplied By macOS

Keep the system versions initially:

- `zsh`
- `curl`
- `zip`
- `unzip`

Only install newer Homebrew versions if a real project requires features missing from Apple's versions. Avoid shadowing system tools just for version-number symmetry with NixOS.

### Install With Homebrew

This is the approved Rhodium carry-over set, with no speculative extras:

```bash
brew install \
  fish \
  nushell \
  starship \
  zellij \
  git \
  gh \
  gitui \
  lazygit \
  git-delta \
  commitizen \
  atuin \
  direnv \
  zoxide \
  eza \
  fzf \
  bat \
  yazi \
  glow \
  btop \
  bottom \
  fd \
  ripgrep \
  ripgrep-all \
  sd \
  jq \
  yq \
  wget \
  xh \
  duf \
  dust \
  tree \
  miller \
  just
```

This deliberately omits Linux-only plumbing and duplicate utilities. `fish` is the interactive default, `zsh` remains the compatibility shell, and Nushell is available for structured-data workflows.

### Shell Selection

On Apple Silicon, Homebrew normally installs Fish under `/opt/homebrew/bin/fish`. Resolve the actual path rather than hard-coding it:

```bash
fish_path="$(brew --prefix)/bin/fish"
grep -qxF "$fish_path" /etc/shells || echo "$fish_path" | sudo tee -a /etc/shells
chsh -s "$fish_path"
```

Keep Zsh functional because vendor installers, bootstrap scripts, and corporate tooling frequently assume it.

## Phase 3: Terminal Applications

Keep both terminals because they serve different roles, but choose one default:

- Ghostty: default daily terminal. It is native-feeling on macOS, fast, and visually clean.
- Kitty: compatibility/fallback terminal and the closest continuation of the existing Rhodium setup.

Install them from the official Ghostty and Kitty websites or the company portal. If Homebrew casks are the approved application channel:

```bash
brew install --cask ghostty kitty
```

Port only the useful configuration:

- Kanso/Chiaroscuro colors.
- One enabled Nerd Font, preferably JetBrains Mono Nerd Font or the licensed Berkeley Mono setup already used by Rhodium.
- Fish/Zsh integration.
- macOS clipboard commands (`pbcopy`, `pbpaste`) instead of Wayland clipboard commands.
- No Wayland, Niri, XDG portal, daemon-preload, or Linux font-rendering settings.

## Phase 4: Keyboard-First macOS Organization

This is the macOS-native replacement for the Niri/Fuzzel/Waybar workflow.

### Required Stack

- Karabiner-Elements: the keyboard mapper. Use it for the Hyper key, tap/hold behavior, device-specific mappings, navigation layers, and ergonomic remaps. It supports both Apple Silicon and Intel Macs.
- AeroSpace: the tiling workspace manager. It provides i3-like workspaces, plain-text configuration, multi-monitor support, and does not require disabling SIP.
- Raycast: the launcher, command palette, file search, snippets, clipboard history, window commands, quick links, and script-command front end.

### Optional Automation Layer

- Hammerspoon: add only when a workflow cannot be expressed cleanly in Karabiner, AeroSpace, Raycast, or native macOS Shortcuts. It exposes macOS window, application, screen, clipboard, Wi-Fi, and event APIs through Lua.
- AltTab: optional if the native app switcher remains frustrating after AeroSpace workspace habits settle.
- MonitorControl: optional for keyboard control of external display brightness and volume.

Install these as native applications from their official sites or the company portal. AeroSpace's official Homebrew route is currently:

```bash
brew install --cask nikitabobko/tap/aerospace
```

### Shortcut Architecture

Use Karabiner-Elements to make Caps Lock dual-purpose:

- Tap Caps Lock: `Escape`.
- Hold Caps Lock: Hyper (`Control + Option + Shift + Command`).

Recommended global map:

| Shortcut | Action |
| --- | --- |
| `Hyper + Space` | Open Raycast |
| `Hyper + Return` | Open Ghostty |
| `Hyper + B` | Work browser |
| `Hyper + E` | Work editor/IDE |
| `Hyper + O` | Notes/documentation |
| `Hyper + M` | Company messaging |
| `Hyper + 1..9` | Switch AeroSpace workspace |
| `Hyper + H/J/K/L` | Focus left/down/up/right |
| `Hyper + Shift + H/J/K/L` | Move window left/down/up/right |
| `Hyper + F` | Fullscreen current window |
| `Hyper + V` | Raycast clipboard history |
| `Hyper + S` | Company-approved screenshot tool |
| `Hyper + R` | Reload AeroSpace/Hammerspoon config |

Keep Karabiner rules, `aerospace.toml`, Raycast script commands, and optional `~/.hammerspoon/init.lua` in a small Mac dotfiles repository. Do not try to translate Niri bindings one-for-one; preserve the muscle memory and outcomes.

## Phase 5: Git And Terminal Workflow

Port these Rhodium behaviors:

- Git identity, but use the company email for work repositories.
- `init.defaultBranch = main`.
- Global ignores including `.DS_Store`, editor swap files, logs, temporary files, and IDE metadata where appropriate.
- Delta as the Git pager.
- GitHub CLI authentication through the company GitHub organization.
- Atuin history, but verify whether cloud sync is permitted. Disable sync or use an approved server if shell history may contain sensitive commands.
- Direnv with explicit project `.envrc` approval.
- Zoxide navigation.
- Yazi's directory-changing wrapper.
- Starship prompt and Zellij layout/keybindings.

Mac-specific corrections to the existing Rhodium shell config:

- Replace `wl-copy` with `pbcopy`.
- Replace `wl-paste` with `pbpaste`.
- Remove Niri, Waybar, NetworkManager, systemd, udev, Bluetooth, display-switching, and Linux notification aliases.
- Replace `/home/pabloagn` paths with `/Users/<work-user>` or `$HOME`.
- Keep `~/.local/bin` only if vendor tools use it; Homebrew executables live under `$(brew --prefix)/bin`.
- Keep personal and professional Git identities separate with conditional includes rather than repeatedly editing global config.

Suggested Git identity split:

```gitconfig
[includeIf "gitdir:~/work/"]
  path = ~/.config/git/work.gitconfig

[includeIf "gitdir:~/personal/"]
  path = ~/.config/git/personal.gitconfig
```

## Phase 6: AI Coding Agents

Install only the three requested agents. Before authentication, confirm the employer's policy on source-code sharing, retention, approved models, MCP servers, and repository access.

### Codex

Use the current Homebrew cask or the employer's managed installer:

```bash
brew install --cask codex
```

Then authenticate with the approved work account. Keep repository-specific instructions in `AGENTS.md`; do not put company secrets in global prompts or config.

### Gemini CLI

The official Gemini CLI repository supports Homebrew:

```bash
brew install gemini-cli
```

Google's individual-account product path changed in 2026, so use the authentication route approved for the work Google Workspace or cloud project rather than assuming a personal-account flow.

### Claude Code

Anthropic currently recommends its native installer, which auto-updates:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

If company policy requires all software to be tracked by Homebrew, use the stable cask instead:

```bash
brew install --cask claude-code
```

Do not install both methods. Verify with `claude doctor` after installation.

## Phase 7: AWS And Containers

### AWS CLI

Install AWS CLI v2 using the employer's standard channel. With Homebrew, the formula is named `awscli`:

```bash
brew install awscli
```

Use SSO profiles and the company's credential process. Do not copy personal AWS credentials, Rhodium secrets, or shell history onto the work machine.

### Docker

Docker on macOS is not just a standalone CLI package; it needs a Linux VM/runtime.

Preferred decision order:

1. Install the company-managed Docker Desktop build if the organization standardizes it.
2. Use OrbStack only if the employer explicitly approves it.
3. Do not install both runtimes.

Docker Desktop includes the Docker CLI and Compose integration. Its commercial licensing can matter for larger organizations, so this decision belongs to IT/procurement rather than a personal bootstrap script.

## Phase 8: Focused Language Tooling

### Python

Use `uv` as the Python version/environment/dependency/tool front end:

```bash
brew install uv pyright
uv tool install ruff@latest
```

Responsibilities:

- `uv`: Python versions, virtual environments, dependencies, command execution, and isolated CLI tools.
- `pyright`: language server and static type checking.
- `ruff`: linting, import sorting, and formatting.

Do not globally install a generic Python data-science stack. Add `pytest`, Jupyter, pandas, Polars, NumPy, dbt, or notebooks to the projects that actually need them. This keeps unrelated projects isolated and lets repositories pin compatible versions.

### Go

Install the toolchain, then install the official language server through Go:

```bash
brew install go
go install golang.org/x/tools/gopls@latest
```

Project-dependent additions:

- `delve` for debugging.
- `golangci-lint` for repository linting.
- `gofumpt` only when the team uses it.

Do not add all three globally until a Go project or team standard requires them.

### SQL

Use one language server and one dialect-aware linter/formatter:

```bash
brew install sql-language-server
uv tool install 'sqlfluff[rs]'
```

- `sql-language-server`: completion and LSP functionality.
- `sqlfluff`: linting/formatting; configure the correct dialect in each project.

Do not install PostgreSQL, Redis, DBeaver, DataGrip, DuckDB, or multiple SQL TUIs globally unless the job actually uses them. A database client is a project/team choice, not part of the laptop baseline.

### Nix

Nix support is for maintaining Rhodium or other Nix repositories; it does not make the Mac a NixOS machine.

If Nix work is required, install Nix on macOS using the employer-approved installer, then install only the language tooling:

```bash
nix profile install nixpkgs#nixd nixpkgs#nixfmt
```

- `nixd`: primary Nix language server.
- `nixfmt`: formatter.

Do not install both `nil` and `nixd`. Do not manage native Mac applications through Nix for this setup. If the work role never touches Nix, omit this entire section.

## Phase 9: Native Work Applications

These are not a package inventory. Install only the applications required by the employer and obtain them from the company portal or official vendor site.

### Required By Role Or Company

- One company-standard browser. Add Firefox, Zen, or Brave only if permitted and useful for profile isolation.
- One company-standard editor or IDE. The baseline does not prescribe VS Code, Zed, PyCharm, or another IDE because the team/project should decide it.
- Company password manager, typically 1Password or an enterprise alternative.
- Company messaging and meeting clients, such as Slack, Teams, or Zoom, only when actually used.
- Company office suite and storage/sync client.
- Company VPN, endpoint protection, certificate tooling, and device-management agents.

### Explicitly Not In The Baseline

- OBS Studio and recording/streaming tools.
- Csound, Pure Data, Sonic Pi, SuperCollider, TidalCycles, VCV Rack, or other music-production software.
- Spotify, Clementine, terminal music players, Roon, Plex, or media-server clients.
- Blender, Figma Linux, GIMP, Inkscape, Darktable, Kdenlive, HandBrake, or creative-production tools unless the job specifically requires them.
- Torrent clients.
- Personal mail, personal VPN, personal chat networks, and personal cloud apps.
- Multiple office suites, note-taking systems, browsers, IDEs, database clients, or task managers installed “just in case.”

## Phase 10: Minimal Organization Workflow

Use a small number of stable surfaces:

- Raycast: launch, search, snippets, clipboard, quick links, and script commands.
- AeroSpace: deterministic workspaces and window placement.
- Karabiner-Elements: global keyboard layer.
- Ghostty + Fish + Zellij: terminal workspace.
- Atuin: command recall.
- Yazi: keyboard-first file navigation.
- GitHub CLI + LazyGit/GitUI: repository operations.
- The employer's task tracker and calendar: work planning. Do not introduce a parallel personal task system unless it solves a demonstrated gap.

Suggested workspaces:

| Workspace | Purpose |
| --- | --- |
| `1` | Terminal and active repository |
| `2` | Editor/IDE |
| `3` | Work browser and documentation |
| `4` | Database/notebook tools when required |
| `5` | Communication and meetings |
| `6` | Calendar and planning |

## Verification Checklist

After setup:

```bash
fish --version
nu --version
starship --version
zellij --version
git --version
gh --version
atuin --version
direnv --version
zoxide --version
yazi --version
rg --version
rga --version
jq --version
yq --version
just --version
codex --version
gemini --version
claude --version
aws --version
docker version
uv --version
pyright --version
ruff --version
go version
gopls version
sql-language-server --version
sqlfluff version
nixd --version
nixfmt --version
```

Skip checks for tools intentionally omitted. Then verify:

- Fish starts cleanly without Linux-only command errors.
- Starship, Atuin, Direnv, Zoxide, FZF, Yazi, and Zellij initialize once, not multiple times.
- `pbcopy`/`pbpaste` integrations work.
- Karabiner Hyper mappings do not conflict with macOS or company shortcuts.
- AeroSpace workspace switching and multi-monitor behavior are stable.
- Raycast global shortcuts do not overlap AeroSpace bindings.
- Git uses the work identity under `~/work` and the correct SSH/SSO method.
- Docker uses the approved runtime and organization account.
- AI agents are authenticated only with approved work identities and policies.

## Final Baseline

The finished machine should have:

- One polished macOS-native productivity layer: Karabiner-Elements + AeroSpace + Raycast.
- Two terminals but one default: Ghostty primary, Kitty fallback.
- A compact Rhodium CLI set installed through Homebrew.
- Three approved coding agents installed through their official channels.
- AWS CLI and one approved Docker runtime.
- Focused Python, Go, SQL, and optional Nix tooling.
- Company-selected browser, editor, communications, office, security, and VPN apps.
- No personal media workstation baggage.

## Official References

- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
- [AeroSpace](https://nikitabobko.github.io/AeroSpace/)
- [Raycast manual](https://manual.raycast.com/)
- [Hammerspoon](https://www.hammerspoon.org/)
- [Ghostty Homebrew cask](https://formulae.brew.sh/cask/ghostty)
- [Kitty Homebrew cask](https://formulae.brew.sh/cask/kitty)
- [Codex CLI setup](https://help.openai.com/en/articles/11096431)
- [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- [Claude Code setup](https://code.claude.com/docs/en/getting-started)
- [Docker Desktop for Mac](https://docs.docker.com/desktop/setup/install/mac-install/)
- [uv installation](https://github.com/astral-sh/uv/blob/main/docs/getting-started/installation.md)
- [Ruff installation](https://docs.astral.sh/ruff/installation/)
- [Pyright installation](https://github.com/microsoft/pyright/blob/main/docs/installation.md)
- [gopls](https://go.dev/gopls/)
- [SQLFluff](https://docs.sqlfluff.com/en/stable/gettingstarted.html)
- [Nix installation](https://nix.dev/install-nix)
- [nixfmt Homebrew formula](https://formulae.brew.sh/formula/nixfmt)
