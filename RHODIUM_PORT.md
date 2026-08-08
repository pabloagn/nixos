# Rhodium Port Audit

This audit maps the current Rhodium NixOS source for porting the best utilities, apps, configs, and themes to a new work MacBook Pro.

## Scope

- Audited flake entry: `nixosConfigurations.host_001` / host `justine`.
- User entry: `users/user_001` / `pabloagn`.
- Evaluated with local `nix eval` against the repository lock; package appendices are exact evaluated top-level package names from this repo state.
- Mac target assumption: use `nix-darwin` + Home Manager for CLI/config; use Homebrew casks or native installers for GUI apps not available/comfortable through Nix on macOS.
- Do not port Linux hardware, Wayland compositor, udev, PipeWire, or systemd service behavior directly to macOS; replace them with macOS equivalents.

## Highest-Value MacBook Port

### Include First

- `fish`, `zsh`, `nushell`, `starship`, `tmux`, `zellij`
- `kitty`, `ghostty`, `git`, `gh`, `gitui`, `lazygit`
- `delta`, `commitizen`, `serie`, `tig`, `direnv`, `atuin`
- `eza`, `fzf`, `skim`, `television`, `bat`, `yazi`
- `glow`, `fastfetch`, `btop`, `bottom`, `htop`, `procs`
- `fd`, `ripgrep`, `ripgrep-all`, `sd`, `jq`, `yq`
- `curl`, `wget`, `xh`, `dogdns`, `gping`, `trippy`
- `duf`, `dua`, `dust`, `ncdu`, `zstd`, `zip`
- `unzip`, `p7zip`, `rar`, `tree`, `miller`, `duckdb`
- `visidata`, `tealdeer`, `wikiman`, `just`, `mask`, `mprocs`
- `presenterm`, `hstr`

### Developer Stack

- `codex`, `gemini-cli`, `aider-chat`, `goose-cli`, `claude-code`
- `claude-monitor`, `awscli2`, `awslogs`, `redis`, `postgresql`
- `dbeaver-bin`, `rainfrog`, `harlequin`, `gobang`, `lazysql`
- `terraform`, `terraform-ls`, `k9s`, `kdash`, `lazydocker`
- `dive`, `ctop`, `docker`, `qemu`, `kvmtool`

### Language Servers, Formatters, Toolchains

- `bash-language-server`, `shfmt`, `shellcheck`, `clojure-lsp`
- `cljfmt`, `clj-kondo`, `cmake-language-server`, `cmake-format`
- `sbcl`, `clang-tools`, `gcc`, `gnumake`
- `crystal`, `icr`, `omnisharp-roslyn`, `vscode-langservers-extracted`
- `html-tidy`, `dart-sass`, `deno`, `dhall`
- `dhall-lsp-server`, `dockfmt`, `dockerfile-language-server`, `elixir`
- `elixir-ls`, `erlang-language-platform`, `erlfmt`, `elmPackages.elm-format`
- `elmPackages.elm-language-server`, `emmet-ls`, `faust`, `fennel-ls`
- `fish-lsp`, `fortls`, `fprettify`, `fsautocomplete`
- `devenv`, `graphviz`, `nodePackages.prettier`, `prettierd`
- `rlwrap`, `socat`, `tree-sitter`, `go`
- `goimports-reviser`, `gopls`, `gofumpt`, `gomodifytags`
- `gotests`, `gore`, `prettier-plugin-go-template`, `nodePackages.graphql-language-service-cli`
- `haskell-language-server`, `haskellPackages.fourmolu`, `haskellPackages.cabal-install`, `haskellPackages.hoogle`
- `google-java-format`, `jdt-language-server`, `nodejs`, `nodePackages.eslint`
- `nodePackages.typescript-language-server`, `biome`, `jinja-lsp`, `jinja2-cli`
- `just-lsp`, `julia`, `kdlfmt`, `kotlin-language-server`
- `texlab`, `texlivePackages.latexindent`, `texlive.combined.scheme-full`, `lua-language-server`
- `stylua`, `markdownlint-cli2`, `markdown-oxide`, `marksman`
- `nil`, `nixd`, `nixfmt-rfc-style`, `ocamlPackages.ocaml-lsp`
- `ocamlPackages.ocamlformat`, `ocamlPackages.dune_3`, `ocamlPackages.utop`, `ocamlPackages.ocp-indent`
- `ocamlPackages.merlin`, `perlnavigator`, `intelephense`, `nodePackages.prisma`
- `prisma-engines`, `buf`, `isort`, `pyright`
- `ruff`, `poetry`, `python3.withPackages`, `rPackages.styler`
- `rPackages.languageserver`, `rustup`, `bacon`, `cargo-info`
- `rusty-man`, `metals`, `scalafmt`, `sqlfluff`
- `sqlite`, `sqls`, `svelte-language-server`, `tailwindcss-language-server`
- `taplo`, `typst`, `tinymist`, `vue-language-server`
- `lemminx`, `yaml-language-server`, `zig`, `zls`

### GUI Apps And Workstation Apps

- `firefox`, `zen-browser`, `brave`, `tor`
- `obsidian`, `standardnotes`, `zathura`, `neovim`
- `neovim-remote`, `helix/evil-helix`, `emacs`, `micro`
- `vscode`, `zed-editor`, `rstudio`, `texmaker`
- `aerc`, `protonmail-desktop`, `spotify`, `clementine`
- `termusic`, `cmus`, `roon-tui`, `roon-bridge`
- `csound`, `puredata`, `sonic-pi`, `supercollider`
- `tidal-dl`, `tidal-hifi`, `vcv-rack`, `blender`
- `figma-linux`, `gimp3-with-plugins`, `inkscape`, `darktable`
- `handbrake`, `kdenlive`, `mpv`, `obs-studio`
- `vlc`, `yt-dlp`, `plex`, `plexamp`
- `qbittorrent`, `libreoffice`, `onlyoffice-desktopeditors`, `slack`
- `teams-for-linux`, `zoom-us`, `signal-desktop`, `telegram-desktop`
- `vesktop`, `element-desktop`, `weechat`, `libqalculate`
- `qalculate-gtk`, `calcure`, `taskwarrior3`, `taskwarrior-tui`
- `uair`, `pom`, `openpomodoro-cli`, `1password-gui`
- `1password-cli`, `age`, `sops`, `pass`
- `gnupg`, `openssl`, `protonvpn-gui`

### Defer Or Replace On macOS

- `niri`, `waybar`, `mako`, `swaybg`
- `swaylock`, `hyprlock`, `fuzzel`, `rofi`
- `wl-clipboard`, `wl-mirror`, `wf-recorder`, `grim`
- `slurp`, `swappy`, `satty`, `hyprpicker`
- `wlsunset`, `wl-kbptr`, `kmonad service/uinput tuning`, `PipeWire/easyeffects/helvum tuning`
- `NetworkManager/firewalld/blueman/bluez`, `ASUS power/backlight/lid services`, `udev rules`, `systemd user services`
- `xwayland-satellite`, `dragon-drop`, `Thunar/GVFS/Tumbler stack`

## Flake Inputs To Keep Or Recreate

- `nixpkgs`: currently `github:NixOS/nixpkgs/nixos-25.11`; for Mac use `nixpkgs` with `system = "aarch64-darwin"` on Apple Silicon or `"x86_64-darwin"` on Intel.
- `home-manager`: currently `github:nix-community/home-manager/release-25.11`; keep for user-level shell, editor, terminal, and app config.
- `nixpkgs-unstable`: used for fresh packages such as `claude-code` and `claude-monitor`; keep as a secondary package set.
- `nur`: used as an overlay source; keep only if any retained package/module needs NUR.
- `zen-browser`: used by `home/apps/browsers/zen.nix`; keep if you want Zen managed by Home Manager.
- `kanso-nvim`: personal Neovim theme fork; keep if retaining the current Neovim theme module.
- `chiaroscuro`: personal theme flake; keep to preserve the Kanso/Chiaroscuro palette.
- `rhodium-alloys`: supplies Fish and Yazi plugin inputs; keep for shell/file-manager parity.
- `iridium-rh`: private SSH input; only keep if work Mac has SSH access and the derivation still needs it.
- `niri-flake`: Linux-only; do not include in macOS flake unless sharing Linux outputs.
- Add for Mac: `nix-darwin` and optionally `nix-homebrew`/Homebrew taps for casks.

## Active Host Profile

- Host data: `justine`, description `Justine Host`, display `eDP-1`, `2880x1620@120`, scale `1.5`.
- Kernel/system: NixOS `system.stateVersion = "24.05"`, kernel pinned to `linuxPackages_6_12`, flakes enabled.
- Desktop: Niri Wayland on AMD, Waybar package, Mako package, Thunar/GVFS/Tumbler, font stack.
- Hardware: PipeWire/WirePlumber, Bluetooth with BlueZ tuning, UPower, CUPS, NetworkManager, firewalld, WireGuard/OpenVPN helpers.
- Host-specific services/rules: ASUS keyboard backlight, laptop lid policy, Keychron udev triggers, NETGEAR A8000 udev, Bluetooth no-powersave, ASUS power profile udev/systemd service.
- VM/memory: zram enabled at 50%, `zstd`, priority `100`; sysctl `vm.swappiness=10`, `vm.vfs_cache_pressure=50`.
- Maintenance: Nix GC enabled daily, delete generations older than `30d`.

## User Profile And Preferences

- User: `pabloagn`, full name `Pablo Aguirre`, main email `pablo.aguirre@protonmail.com`.
- Groups: `wheel`, `networkmanager`, `docker`, `input`, `uinput`, `video`.
- Shell preference: `fish`; alternate shell `zsh`; system modules also enable `bash` and `nushell`.
- App preferences: terminal `kitty`, alternate `ghostty`; browser `firefox`, alternate `brave`; editor `nvim`, alternate `hx`; IDE `zeditor`, alternate `code`; file TUI `yazi`; file GUI `thunar`; image viewer `imv`; media player `mpv`; PDF viewer `org.pwmt.zathura`; pager `most`.
- Behavior preferences: cursor size `32`, DPI adjustment `140`, keyboard repeat `60`, keyboard delay `250`, GDK scale `2`, GDK DPI `140`.
- Theme preference: `chiaroscuro`, variant `dark`.

### Portable Session Variables

- `BROWSER` = `firefox`
- `EDITOR` = `nvim`
- `VISUAL` = `nvim`
- `SUDO_EDITOR` = `nvim`
- `TERMINAL` = `kitty`
- `IMAGE_VIEWER` = `imv`
- `VIDEO_PLAYER` = `mpv`
- `AUDIO_PLAYER` = `mpv`
- `PDF_VIEWER` = `org.pwmt.zathura`
- `PAGER` = `most`
- `MANPAGER` = `most`
- `WM` = `hyprland`
- `RHODIUM` = `/home/pabloagn/dev/rhodium`
- `DEV_ALLOYS` = `/home/pabloagn/dev/alloys.rhf`
- `DEV_CHIAROSCURO` = `/home/pabloagn/dev/chiaroscuro.rht`
- `DEV_PHANTOM` = `/home/pabloagn/dev/phantom`
- `DEV_UTILS` = `/home/pabloagn/dev/utils`
- `HOME_ACADEMIC` = `/home/pabloagn/academic`
- `HOME_DOWNLOADS` = `/home/pabloagn/downloads`
- `HOME_PROFESSIONAL` = `/home/pabloagn/professional`
- `HOME_SOLENOIDLABS` = `/home/pabloagn/solenoid-labs`
- `HOME_VAULTS` = `/home/pabloagn/vaults`
- `HOME_VAULTS_SANCTUM` = `/home/pabloagn/vaults/sanctum`
- `HOME_VAULTS_FICTION` = `/home/pabloagn/vaults/fiction`
- `DOOMDIR` = `/home/pabloagn/.config/doom`
- `XDG_BIN_HOME` = `/home/pabloagn/.local/bin`
- `XDG_CONFIG_HOME` = `/home/pabloagn/.config`
- `XDG_CACHE_HOME` = `/home/pabloagn/.cache`
- `XDG_DATA_HOME` = `/home/pabloagn/.local/share`
- `XDG_STATE_HOME` = `/home/pabloagn/.local/state`


## Shells And Terminal UX

- Fish is primary: vi bindings, no greeting, block/line cursors by mode, `history_max = 1000000`, Atuin integration with `ATUIN_NOBIND=true`, custom Ctrl bindings for file/dir/project jumps, Yazi, and history.
- Zsh is fully configured: autosuggestions, completion, autocd, syntax highlighting, vi mode, very large shared history at `${XDG_CACHE_HOME}/zsh/.zsh_history`, and Yazi `yy` function.
- Bash has shared aliases and completion; history under `${XDG_CACHE_HOME}/bash/.bash_history`.
- Nushell is imported and enabled; keep its aliases/env modules if you use Nu on macOS.
- Starship is enabled for Bash/Fish/Zsh with Kanso colors, custom timing module, Nix shell display, Git/Docker/Kubernetes/language modules, and a multi-line prompt.
- Tmux is enabled with mouse, 24h clock, no confirmation prompts, history `10000`, and `tmuxPlugins.tmux-fzf`; Zellij is also enabled.
- Kitty and Ghostty are both enabled with shell integrations; Foot is enabled in Linux but is not a Mac priority.
- Mac replacements needed: replace `wl-copy`/`wl-paste` aliases and Fish/Zsh clipboard bindings with `pbcopy`/`pbpaste`; replace Niri aliases with Aerospace/Yabai/SketchyBar equivalents if desired.

## Editors And IDEs

### Neovim

- Home Manager enables `programs.neovim` with `neovim-remote` and imports the full custom Lua tree under `home/apps/editors/nvim`.
- Active plugin inventory:

- `coding.nix: nvim-cmp, cmp-buffer, cmp-dictionary, cmp-latex-symbols, cmp-nixpkgs-maintainers, cmp-nvim-lsp, cmp-path, comment-nvim, molten-nvim, csv-vim, vim-nix, vimtex, render-markdown-nvim, typst-preview-nvim, vim-go, multicursors-nvim, kmonad-vim, friendly-snippets, luasnip, nvim-treesitter-context, nvim-treesitter-textobjects, nvim-treesitter`
- `default.nix: `
- `editor.nix: nvim-spectre, nvim-tree-lua, nvim-tree, hydra-nvim, yazi-nvim, telescope-nvim, telescope-frecency-nvim, telescope-ui-select-nvim, telescope-fzf-native-nvim, telescope-live-grep-args-nvim, telescope-project-nvim, aerial-nvim, flash-nvim, harpoon2, harpoon2-nvim, marks-nvim, vim-illuminate, vim-illuminate-nvim, indent-blankline-nvim, orgmode, snacks-nvim, todo-comments-nvim, which-key-nvim, zen-mode-nvim`
- `lsp.nix: nvim-lspconfig, SchemaStore-nvim, fidget-nvim, trouble-nvim, conform-nvim`
- `themes.nix: nvim-colorizer-lua, tokyonight-nvim, kanso-nvim`
- `ui.nix: bufferline-nvim, dashboard-nvim, nvim-web-devicons, noice-nvim, nui-nvim, lualine-nvim, lualine-lsp-progress`
- `utils.nix: gitsigns-nvim, octo-nvim, plenary-nvim, venn-nvim`

### Helix, Emacs, Micro

- Helix is enabled with `pkgs.evil-helix`.
- Emacs is enabled with `pkgs.emacs`; `DOOMDIR` points to `${XDG_CONFIG_HOME}/doom` and `${HOME}/.config/emacs/bin` is added to `PATH`.
- Micro is enabled as a lightweight terminal editor.
- Kakoune and Neovide configs exist but are disabled.

### Zed

- Zed is enabled and should be ported to macOS.
- Extensions: `nix`, `html`, `toml`, `dockerfile`, `catpuccin icons`, `git firefly`, `sql`, `latex`, `make`, `scss`, `elixir`, `lua`, `zig`, `biome`, `csv`, `ruff`, `python-lsp`, `rainbow-csv`, `env`, `tokyo-night`, `phosphor-icons-theme`, `kanso`.
- Key settings: Vim mode, `BerkeleyMonoRh Nerd Font` buffer font, `Work Sans` UI font, no Copilot, telemetry disabled, line numbers/folds/runnables enabled, Jupyter Python kernel `nixpython`, Python format-on-save via language server.
- Theme: `Kanso Zen (Borderless)` dark, `Kanso Pearl (Borderless)` light, `Catppuccin Mocha` icons, custom border overrides.

### VS Code

- VS Code is enabled with mutable extension dir, update check disabled, and settings/keybindings/profiles imported.
- `extensions.nix` exists but is commented out; dormant exact extensions are `editorconfig.editorconfig`, `streetsidesoftware.code-spell-checker`, `ziglang.vscode-zig`, `ms-vscode-remote.remote-wsl`, `aaron-bond.better-comments`.

## Browsers And Profiles

- Firefox is enabled via both NixOS and Home Manager.
- Zen Browser is enabled through `inputs.zen-browser.homeModules.twilight` with a `Personal` profile, HTTPS-only, DNT/GPC, DNS prefetch disabled, telemetry/app updates disabled, smooth scrolling disabled, and downloads to `~/downloads`.
- Brave, Tor, `w3m`, `lynx`, and `browsh` are installed from the browser module.
- LibreWolf and Qutebrowser modules exist but are disabled.
- Firefox profile names from preferences: `personal`, `media`, `solenoidlabs`, `uk`, `academic`, `bsogood`, `phantom`, `genai`, `genai-2`, `amsterdam`, `ultra`, `segmentaim`, `littlejohn`, `atmosphericai`, `private`.
- Zen profile names from preferences: `personal`, `work`, `media`, `dev`.
- Chromium/Brave profile names from preferences: `personal`, `work`, `media`.

## Git And Version Control

- Git is enabled with `user.name = "Pablo Aguirre"`, `user.email = "pablo.aguirre@protonmail.com"`, and `init.defaultBranch = "main"`.
- Global ignores: editor swap/project files, `.DS_Store`, `Thumbs.db`, build artifacts, logs, `*.tmp`, `*.bak`, `.cache/`.
- Delta is enabled with Git integration.
- GitHub CLI (`gh`), GitUI, LazyGit, `commitizen`, `serie`, and `tig` are installed/enabled.

## Themes, Fonts, Assets

- Active theme selector: `home/assets/themes/chiaroscuro.nix`, dark variant; temporary theme inputs also reference `inputs.chiaroscuro.themes.kanso-zen`.
- Assets linked by Home Manager: wallpapers, colors, icons, ASCII art from `home/assets` into XDG data directories; script linking is enabled for all valid script folders.
- GTK theme: `Adwaita-dark`; icon theme `Papirus-Dark`; cursor `phinger-cursors-dark`, size `24`; Qt platform theme `gtk`; Qt style `kvantum`; Catppuccin Kvantum package uses `mocha` + `mauve`.
- Enabled fonts from generated Home Manager inventory:

- `display/comfortaa: Comfortaa`, `display/dancing-script: Dancing Script`, `display/oswald: Oswald`
- `monospace/anonymous-pro: Anonymous Pro`, `monospace/cascadia-code: Cascadia Code`, `monospace/dejavu-sans-mono: DejaVu Sans Mono`
- `monospace/fantasque-sans-mono: Fantasque Sans Mono`, `monospace/fira-code: Fira Code`, `monospace/fira-mono: Fira Mono`
- `monospace/hack-font: Hack`, `monospace/ibm-plex-mono: IBM Plex Mono`, `monospace/inconsolata: Inconsolata`
- `monospace/jetbrains-mono: JetBrains Mono`, `monospace/julia-mono: JuliaMono`, `monospace/maple-mono: Maple Mono`
- `monospace/office-code-pro: Office Code Pro`, `monospace/paratype-pt-mono: PT Mono`, `monospace/roboto-mono: Roboto Mono`
- `monospace/source-code-pro: Source Code Pro`, `monospace/ubuntu-mono: Ubuntu Mono`, `monospace/victor-mono: Victor Mono`
- `monospace-pro/commit-mono: CommitMono`, `monospace-pro/geist-mono: Geist Mono`, `monospace-pro/input-mono: Input Mono`
- `monospace-pro/iosevka: Iosevka`, `monospace-pro/monaspace: Monaspace`, `monospace-pro/recursive: Recursive`
- `sans-serif/atkinson-hyperlegible: Atkinson Hyperlegible`, `sans-serif/cabin: Cabin`, `sans-serif/dosis: Dosis`
- `sans-serif/fira-sans: Fira Sans`, `sans-serif/inter: Inter`, `sans-serif/lato: Lato`
- `sans-serif/liberation-ttf: Liberation`, `sans-serif/montserrat: Montserrat`, `sans-serif/noto-fonts: Noto Sans`
- `sans-serif/noto-fonts-cjk-sans: Noto Sans CJK`, `sans-serif/noto-fonts-color-emoji: Noto Emoji`, `sans-serif/open-sans: Open Sans`
- `sans-serif/overpass: Overpass`, `sans-serif/poppins: Poppins`, `sans-serif/quicksand: Quicksand`
- `sans-serif/raleway: Raleway`, `sans-serif/roboto: Roboto`, `sans-serif/source-sans-pro: Source Sans Pro`
- `sans-serif/ubuntu: Ubuntu`, `sans-serif/work-sans: Work Sans`, `serif/alegreya: Alegreya`
- `serif/cardo: Cardo`, `serif/crimson: Crimson`, `serif/eb-garamond: EB Garamond`
- `serif/garamond-libre: Garamond Libre`, `serif/gelasio: Gelasio`, `serif/latin-modern: Latin Modern`
- `serif/libre-baskerville: Libre Baskerville`, `serif/lora: Lora`, `serif/merriweather: Merriweather`
- `serif/source-serif-pro: Source Serif Pro`, `serif/vollkorn: Vollkorn`

## Applications And App Launch Registry

The repo contains a custom app registry in `data/users/extras/apps.nix` used by launchers/menus. Exact keys:

- `editors`, `gaming`, `media`, `multiplexers`, `productivity`, `shells`, `social`, `system`, `terminals`, `viewers`
  - `editors`: `code`, `editor-instance`, `emacs`, `helix-instance`, `nvim-instance`, `rstudio`, `texmaker`, `zeditor`
  - `gaming`: `steam`
  - `media`: `gimp`, `inkscape`, `ncspot`, `obs`, `plexamp`, `spotify`
  - `multiplexers`: `tmux-session`, `zellij`
  - `productivity`: `bitwarden`, `brave`, `calcure`, `firefox-incognito`, `jitsimeet`, `libreofficebase`, `libreofficecalc`, `libreofficedraw`, `libreofficeglobal`, `libreofficeimpress`, `libreofficemath`, `libreofficeweb`, `libreofficewriter`, `obsidian`, `onepassword`, `protonmail`, `protonvpn`, `qalc`, `qalculate`, `qbittorrent`, `slack`, `standardnotes`, `teams`, `thunar`, `yazi`, `zen`, `zoomus`
  - `shells`: `bash-shell`, `fish-shell`, `nu-shell`, `zsh-shell`
  - `social`: `discord`, `discordo`, `element-call`, `fluffychat`, `mastodon`, `signal-desktop`, `telegram-desktop`
  - `system`: `bottom`, `btop`
  - `terminals`: `foot-instance`, `ghostty-instance`, `kitty-instance`
  - `viewers`: `image-viewer`

## Bookmarks, Profiles, Osmium Registry

### Bookmark Registry Keys

- `academic`, `amsterdam`, `genai`, `media`, `personal`, `solenoidlabs`, `uk`
  - `academic`: `blackboard`, `overleaf`
  - `amsterdam`: `amazon-nl`
  - `genai`: `chatgpt`, `claude`, `claude-2`, `gemini`, `gemini-ai-studio`, `lumo`, `perplexity`, `qwen`
  - `media`: `darknetdiaries`, `highclouds`, `torrenting-1337xto`, `torrenting-thepiratebay`, `video-downloader`, `youtube`, `youtube-allianz-tutorial`, `youtube-favourites`, `youtube-hilarious`, `youtube-music`, `youtube-watchlater`
  - `personal`: `akiflow`, `allianz`, `allianz-plus-pdf`, `amazon-mexico`, `american-express`, `asciiart`, `asciiart-imagetoascii`, `aws-main-admin`, `aws-main-buckets-rhodium`, `aws-main-root`, `cloudflare`, `cloudping`, `common-mimetypes`, `craft-docs`, `downloads`, `emojipedia`, `firefox-addons`, `firefox-extensions`, `firefox-profiles`, `firefox-settings`, `firefox-themes`, `github`, `github-chiaroscuro`, `github-phantom`, `github-rhodium`, `gnome-style-schemes`, `goodreads`, `google-advanced-search`, `google-images`, `google-search`, `inoreader`, `letterboxd`, `linear`, `linear-rhodium`, `linkedin`, `markdown-to-excel`, `medium`, `mercadolibre`, `mynixos`, `namecheap`, `nerdfonts`, `nix-operators`, `nix-pills`, `nixos-environment-variables`, `nixos-home-manager-manual`, `nixos-home-manager-options`, `nixos-options`, `nixos-packages`, `omnivore`, `p5js`, `pastebin`, `pinterest`, `plainapp-fiio`, `plainapp-oppo`, `plex`, `preferences`, `preferences-containers`, `preferences-privacy`, `protondashboard`, `protondrive`, `protonmail`, `reddit`, `server-LME-QNAP-6S4R`, `server-alexandria`, `simpleicons`, `standard-notes`, `terminal-sexy`, `tvtime`, `unsplash`, `vercel`, `whatsapp`, `yazi-docs`
  - `solenoidlabs`: `figma`, `github`, `googledrive`, `rhodium-web`, `rhodium-web-docs`, `upwork`, `vercel-rhodium`
  - `uk`: `airbnb`, `amazon-uk`, `boots`, `google-maps`, `ikea-uk`, `paypal-uk`, `sainsburys`, `tesco`

### Extra Profile Registry Keys

- `firefox`
  - `firefox`: `academic`, `amsterdam`, `atmosphericai`, `bsogood`, `genai`, `genai-2`, `littlejohn`, `media`, `personal`, `phantom`, `private`, `segmentaim`, `solenoidlabs`, `uk`

### Osmium Self-Hosted Service Registry Keys

- `development`, `infrastructure`, `media`, `monitoring`, `productivity`, `storage`
  - `development`: `langfuse`, `llms`, `temporal`
  - `infrastructure`: `authelia`, `cloudflare-dashboard`, `cloudflare-dns`, `drone`, `homepage`, `namecheap`, `tailscale`, `traefik`, `vaultwarden`
  - `media`: `calibre`, `immich`, `navidrome`, `plex`, `prowlarr`, `qbittorrent`, `radarr`, `sonarr`
  - `monitoring`: `grafana`
  - `productivity`: `pastebin`
  - `storage`: `backups`, `nextcloud`, `registry`

## Custom Scripts To Port Or Replace

- Scripts are linked from `home/scripts` to `~/.local/bin` by `home/modules/scripts.nix` when `scripts.enable = true`.
- Valid linked folders: `common`, `docker`, `fuzzel`, `launchers`, `rdp`, `rofi`, `testing`, `utils`, `waybar`.
- Mac priority: keep `common`, `docker`, general `launchers`, selected `utils`, and possibly `rdp`; rewrite `fuzzel`, `rofi`, `waybar`, screenshot/display/WiFi scripts for macOS tools.

<details>
<summary>Exact script files</summary>

- home/scripts/common/bootstrap.sh
- home/scripts/common/functions.sh
- home/scripts/docker/docker.sh
- home/scripts/fuzzel/fuzzel-apps.sh
- home/scripts/fuzzel/fuzzel-askpass.sh
- home/scripts/fuzzel/fuzzel-auth.sh
- home/scripts/fuzzel/fuzzel-bluetooth.sh
- home/scripts/fuzzel/fuzzel-colors.sh
- home/scripts/fuzzel/fuzzel-display.sh
- home/scripts/fuzzel/fuzzel-emoji.sh
- home/scripts/fuzzel/fuzzel-find.sh
- home/scripts/fuzzel/fuzzel-go.sh
- home/scripts/fuzzel/fuzzel-help.sh
- home/scripts/fuzzel/fuzzel-icons.sh
- home/scripts/fuzzel/fuzzel-journals.sh
- home/scripts/fuzzel/fuzzel-kill.sh
- home/scripts/fuzzel/fuzzel-launch.sh
- home/scripts/fuzzel/fuzzel-mounts.sh
- home/scripts/fuzzel/fuzzel-networking.sh
- home/scripts/fuzzel/fuzzel-osmium.sh
- home/scripts/fuzzel/fuzzel-power.sh
- home/scripts/fuzzel/fuzzel-query.sh
- home/scripts/fuzzel/fuzzel-remote.sh
- home/scripts/fuzzel/fuzzel-services.sh
- home/scripts/fuzzel/fuzzel-temperature.sh
- home/scripts/fuzzel/fuzzel-usb.sh
- home/scripts/fuzzel/fuzzel-vaults.sh
- home/scripts/fuzzel/fuzzel-wifi.sh
- home/scripts/fuzzel/fuzzel-xecute.sh
- home/scripts/fuzzel/fuzzel-yank.sh
- home/scripts/fuzzel/fuzzel-zutils.sh
- home/scripts/launchers/launchers-btop.sh
- home/scripts/launchers/launchers-calcure.sh
- home/scripts/launchers/launchers-fastfetch.sh
- home/scripts/launchers/launchers-qalc.sh
- home/scripts/launchers/launchers-qalculate.sh
- home/scripts/launchers/launchers-television.sh
- home/scripts/legacy/fuzzel-display.sh
- home/scripts/legacy/fuzzel-launcher.bkp.sh
- home/scripts/legacy/fuzzel-temperature-adjust.sh
- home/scripts/legacy/fuzzel-temperature.sh
- home/scripts/nix/monitor-switcher.nix
- home/scripts/rdp/rdp-connect.sh
- home/scripts/rofi/rofi-bluetooth.sh
- home/scripts/rofi/rofi-devices.sh
- home/scripts/rofi/rofi-emoji.sh
- home/scripts/rofi/rofi-execs.sh
- home/scripts/rofi/rofi-jumper.sh
- home/scripts/rofi/rofi-launcher.sh
- home/scripts/rofi/rofi-launcher-v2.sh
- home/scripts/rofi/rofi-power.sh
- home/scripts/rofi/rofi-ssh.sh
- home/scripts/rofi/rofi-wallpaper.sh
- home/scripts/rofi/rofi-wifi.sh
- home/scripts/testing/test-hyprlock.sh
- home/scripts/testing/test-mako.sh
- home/scripts/testing/test-swaylock.sh
- home/scripts/utils/utils-checkvpn.sh
- home/scripts/utils/utils-kill.sh
- home/scripts/utils/utils-ocr.sh
- home/scripts/utils/utils-opacity.sh
- home/scripts/utils/utils-polkit.sh
- home/scripts/utils/utils-prefetch.sh
- home/scripts/utils/utils-screenshot-annotate.sh
- home/scripts/utils/utils-screenshot.sh
- home/scripts/utils/utils-switch-displays.sh
- home/scripts/utils/utils-switchkeyboard.sh
- home/scripts/utils/utils-switch-wifi.sh
- home/scripts/utils/utils-toggle-waybar.sh
- home/scripts/waybar/custom-clock-control.sh
- home/scripts/waybar/custom-clock.sh
- home/scripts/waybar/custom-thermals.sh
- home/scripts/waybar/custom-vpn.sh
- home/scripts/waybar.pendings/custom-clock-control.sh
- home/scripts/waybar.pendings/custom-clock.sh
- home/scripts/waybar.pendings/custom-thermals.sh

</details>

## User Services

- Enabled in `users/user_001`: `rh-brave-preload`, `rh-firefox-preload`, `rh-kmonad`, `rh-swaybg`, `rh-system-keyring`, `rh-wifiSwitch`, `rh-hdmiAutoSwitch`.
- Disabled but available: `rh-eww`, `rh-mako`, `rh-neovim-daemon`, `rh-waybar`, `rh-wlsunset`.
- Linux/systemd-only: browser preload services use `vmtouch`; Kmonad service uses Linux input/uinput; swaybg/Waybar/Mako/WLSunset are Wayland services; WiFi/display switching use NetworkManager/Niri/display scripts.
- Mac replacements: `launchd` agents, native 1Password/keychain, Karabiner-Elements/KMonad-for-macOS, Aerospace/Yabai display/window scripts, and `caffeinate`/Shortcuts if needed.

## Exact Active Source Package Map

This map is from active imported source files for `host_001` + `user_001`. Some imported modules are option-gated; the evaluated package appendices show what is actually realized.

| Source | Packages / identifiers |
| --- | --- |
| `modules/hardware/audio.nix` | `pamixer`, `pavucontrol`, `playerctl`, `wireplumber` |
| `modules/hardware/battery.nix` | `acpi` |
| `modules/hardware/bluetooth.nix` | `blueman`, `bluez`, `bluez-tools` |
| `modules/hardware/keyboard.nix` | `xorg.xev` |
| `modules/hardware/network.nix` | `firewalld`, `firewalld-gui`, `networkmanager`, `networkmanager-openvpn`, `networkmanagerapplet`, `wireguard-tools`, `wireguard-ui`, `openresolv` |
| `modules/hardware/video.nix` | `brightnessctl`, `ddcutil`, `wdisplays`, `wlsunset` |
| `modules/desktop/bar/waybar/default.nix` | `waybar` |
| `modules/desktop/fonts/default.nix` | `fira-code`, `fira-code-symbols`, `nerd-fonts.fira-code`, `fira-mono`, `nerd-fonts.fira-mono`, `hack-font`, `nerd-fonts.hack`, `ibm-plex`, `nerd-fonts.blex-mono`, `jetbrains-mono`, `nerd-fonts.jetbrains-mono`, `julia-mono`, `roboto-mono`, `nerd-fonts.roboto-mono`, `office-code-pro`, `inconsolata`, `cascadia-code`, `nerd-fonts.caskaydia-cove`, `iosevka`, `nerd-fonts.iosevka`, `nerd-fonts.iosevka-term`, `nerd-fonts.iosevka-term-slab`, `nerd-fonts.zed-mono`, `paratype-pt-mono`, `liberation_ttf`, `noto-fonts`, `noto-fonts-cjk-sans`, `noto-fonts-color-emoji`, `work-sans`, `roboto`, `raleway`, `quicksand`, `lato`, `dosis`, `open-sans`, `montserrat`, `source-sans-pro`, `libre-franklin`, `cardo`, `merriweather`, `garamond-libre`, `crimson`, `gelasio`, `font-awesome`, `powerline-fonts`, `powerline-symbols`, `nerd-fonts.symbols-only` |
| `modules/desktop/notifications/default.nix` | `libnotify` |
| `modules/desktop/notifications/mako.nix` | `mako` |
| `modules/desktop/wm/niri/amd.nix` | `radeontop`, `rocmPackages.clr`, `libvdpau-va-gl` |
| `modules/desktop/wm/niri/base.nix` | `wl-clipboard`, `wayland-utils`, `wev`, `wlr-randr`, `pkgs-unstable.xwayland-satellite`, `dragon-drop` |
| `modules/apps/terminals/default.nix` | `kitty` |
| `modules/utils/core.nix` | `gdb`, `glib`, `gsettings-desktop-schemas`, `libGL`, `libGLU`, `libva`, `mesa`, `coreutils`, `coreutils-prefixed`, `util-linux`, `uutils-coreutils-noprefix`, `gnumake`, `gnutls`, `gcc`, `pkg-config`, `git`, `hwinfo`, `dmidecode`, `dool`, `inxi`, `lshw`, `pciutils`, `read-edid`, `smartmontools`, `upower`, `usbutils`, `evtest`, `libinput`, `alsa-utils`, `stress` |
| `modules/utils/filesystem.nix` | `dua`, `dust`, `eza`, `file`, `gawk`, `lsof`, `ncdu`, `p7zip`, `rar`, `unzip`, `zip`, `zstd` |
| `modules/utils/monitoring.nix` | `bottom`, `btop`, `mesa-demos`, `hyperfine`, `nmon`, `psmisc`, `lm_sensors` |
| `modules/utils/networking.nix` | `curl`, `dig`, `ipfetch`, `wget`, `wirelesstools`, `xh` |
| `modules/utils/nix.nix` | `nil`, `nixd`, `nixfmt-rfc-style` |
| `modules/utils/text.nix` | `fd`, `jq`, `ripgrep`, `ripgrep-all`, `sd`, `yq` |
| `home/services/astal.nix` | `astalPkg` |
| `home/services/brave.nix` | `pkgs.vmtouch` |
| `home/services/firefox.nix` | `pkgs.vmtouch` |
| `home/services/keyring.nix` | `seahorse`, `libsecret` |
| `home/apps/browsers/default.nix` | `brave`, `tor`, `w3m`, `lynx`, `browsh` |
| `home/apps/docs/obsidian.nix` | `obsidian` |
| `home/apps/docs/okular.nix` | `kdePackages.okular` |
| `home/apps/docs/standardnotes.nix` | `standardnotes` |
| `home/apps/editors/nvim.nix` | `neovim-remote` |
| `home/apps/files/default.nix` | `filezilla`, `celeste` |
| `home/apps/files/thunar.nix` | `xfce.thunar`, `xfce.thunar-volman`, `xfce.thunar-archive-plugin` |
| `home/apps/ides/rstudio.nix` | `rstudio` |
| `home/apps/ides/texmaker.nix` | `texmaker` |
| `home/apps/mail/default.nix` | `aerc` |
| `home/apps/mail/protonmail.nix` | `protonmail-desktop` |
| `home/apps/media/audio/default.nix` | `clementine`, `easyeffects`, `helvum`, `playerctl`, `cavalier`, `termusic`, `cmus`, `roon-tui`, `roon-bridge` |
| `home/apps/media/audio/csound.nix` | `csound` |
| `home/apps/media/audio/puredata.nix` | `maxl`, `puredata`, `timbreid`, `zexy` |
| `home/apps/media/audio/sonicpi.nix` | `sonic-pi` |
| `home/apps/media/audio/spotify.nix` | `spotify`, `spotify-player` |
| `home/apps/media/audio/supercollider.nix` | `supercollider` |
| `home/apps/media/audio/tidal.nix` | `tidal-dl`, `tidal-hifi` |
| `home/apps/media/audio/tidalcycles.nix` | `haskellPackages.tidal` |
| `home/development/agents/default.nix` | `codex`, `gemini-cli`, `aider-chat`, `goose-cli`, `pkgs-unstable.claude-code`, `pkgs-unstable.claude-monitor` |
| `home/development/async/default.nix` | `expect` |
| `home/development/cloud/default.nix` | `awscli2`, `awslogs` |
| `home/development/databases/default.nix` | `redis`, `postgresql`, `dbeaver-bin`, `rainfrog`, `harlequin`, `gobang`, `lazysql` |
| `home/development/infra/default.nix` | `terraform`, `terraform-ls`, `k9s`, `kdash`, `lazydocker`, `dive`, `ctop` |
| `home/development/languages/bash.nix` | `bash-language-server`, `shfmt`, `shellcheck` |
| `home/development/languages/clojure.nix` | `clojure-lsp`, `cljfmt`, `clj-kondo` |
| `home/development/languages/cmake.nix` | `cmake-language-server`, `cmake-format` |
| `home/development/languages/commonlisp.nix` | `sbcl` |
| `home/development/languages/cpp.nix` | `clang-tools`, `gcc`, `gnumake` |
| `home/development/languages/crystal.nix` | `crystal`, `icr` |
| `home/development/languages/csharp.nix` | `omnisharp-roslyn` |
| `home/development/languages/css.nix` | `vscode-langservers-extracted`, `html-tidy`, `dart-sass` |
| `home/development/languages/deno.nix` | `deno` |
| `home/development/languages/dhall.nix` | `dhall`, `dhall-lsp-server` |
| `home/development/languages/docker.nix` | `dockfmt`, `dockerfile-language-server` |
| `home/development/languages/elixir.nix` | `elixir`, `elixir-ls`, `erlang-language-platform`, `erlfmt` |
| `home/development/languages/elm.nix` | `elmPackages.elm-format`, `elmPackages.elm-language-server` |
| `home/development/languages/emmet.nix` | `emmet-ls` |
| `home/development/languages/faust.nix` | `faust` |
| `home/development/languages/fennel.nix` | `fennel-ls` |
| `home/development/languages/fish.nix` | `fish-lsp` |
| `home/development/languages/fortran.nix` | `fortls`, `fprettify` |
| `home/development/languages/fsharp.nix` | `fsautocomplete` |
| `home/development/languages/general.nix` | `devenv`, `graphviz`, `nodePackages.prettier`, `prettierd`, `rlwrap`, `socat`, `tree-sitter` |
| `home/development/languages/glsl.nix` | `glslls` |
| `home/development/languages/go.nix` | `go`, `goimports-reviser`, `gopls`, `gofumpt`, `gomodifytags`, `gotests`, `gore`, `prettier-plugin-go-template` |
| `home/development/languages/graphql.nix` | `nodePackages.graphql-language-service-cli` |
| `home/development/languages/haskell.nix` | `haskell-language-server`, `haskellPackages.fourmolu`, `haskellPackages.cabal-install`, `haskellPackages.hoogle` |
| `home/development/languages/java.nix` | `google-java-format`, `jdt-language-server` |
| `home/development/languages/javascript.nix` | `nodejs`, `nodePackages.eslint`, `nodePackages.prettier`, `nodePackages.typescript-language-server`, `biome` |
| `home/development/languages/jinja.nix` | `jinja-lsp`, `jinja2-cli` |
| `home/development/languages/just.nix` | `just`, `just-lsp` |
| `home/development/languages/julia.nix` | `julia` |
| `home/development/languages/kdl.nix` | `kdlfmt` |
| `home/development/languages/kotlin.nix` | `kotlin-language-server` |
| `home/development/languages/latex.nix` | `texlab`, `texlivePackages.latexindent`, `texlive.combined.scheme-full` |
| `home/development/languages/lua.nix` | `lua-language-server`, `stylua` |
| `home/development/languages/markdown.nix` | `markdownlint-cli2`, `markdown-oxide`, `marksman` |
| `home/development/languages/nix.nix` | `nil`, `nixd`, `nixfmt-rfc-style` |
| `home/development/languages/ocaml.nix` | `ocamlPackages.ocaml-lsp`, `ocamlPackages.ocamlformat`, `ocamlPackages.dune_3`, `ocamlPackages.utop`, `ocamlPackages.ocp-indent`, `ocamlPackages.merlin` |
| `home/development/languages/perl.nix` | `perlnavigator` |
| `home/development/languages/php.nix` | `intelephense` |
| `home/development/languages/prisma.nix` | `nodePackages.prisma`, `prisma-engines` |
| `home/development/languages/protobuf.nix` | `buf` |
| `home/development/languages/python.nix` | `isort`, `pyright`, `ruff`, `poetry`, `python3.withPackages`, `ps`, `ipykernel`, `jupyter`, `jupyter-client`, `cairosvg`, `kaleido`, `nbformat`, `pillow`, `plotly`, `pynvim`, `pyperclip`, `matplotlib`, `numpy`, `pandas`, `wcwidth`, `black`, `pyflakes`, `pipenv`, `pytest`, `grip` |
| `home/development/languages/r.nix` | `rPackages.styler`, `rPackages.languageserver` |
| `home/development/languages/rust.nix` | `rustup`, `bacon`, `cargo-info`, `rusty-man` |
| `home/development/languages/scala.nix` | `metals`, `scalafmt` |
| `home/development/languages/sql.nix` | `sqlfluff`, `sqlite`, `sqls` |
| `home/development/languages/svelte.nix` | `svelte-language-server` |
| `home/development/languages/tailwind.nix` | `tailwindcss-language-server` |
| `home/development/languages/terraform.nix` | `terraform-ls` |
| `home/development/languages/toml.nix` | `taplo` |
| `home/development/languages/typst.nix` | `typst`, `tinymist` |
| `home/development/languages/vue.nix` | `vue-language-server` |
| `home/development/languages/xml.nix` | `lemminx` |
| `home/development/languages/yaml.nix` | `yaml-language-server` |
| `home/development/languages/zig.nix` | `zig`, `zls` |
| `home/development/misc/default.nix` | `atac`, `jqp`, `fx` |
| `home/development/ml/default.nix` | `autogen`, `dvc`, `llama-cpp`, `ollama`, `text-generation-webui`, `ggml-tools`, `huggingface-cli`, `haystack`, `whisper-cpp`, `comfyui`, `milvus`, `qdrant` |
| `home/development/opsec/default.nix` | `apktool`, `ghidra`, `radare2`, `aircrack-ng`, `hashcat`, `hydra`, `hydra-cli`, `john`, `johnny`, `thc-hydra`, `tor`, `metasploit`, `autopsy`, `maltego`, `nmap`, `social-engineer-toolkit`, `wpscan`, `kismet`, `snort`, `wireshark`, `wireshark-qt`, `burpsuite`, `kali-tools`, `lynis`, `nikto`, `sqlmap`, `wordlists`, `openvas`, `zaproxy` |
| `home/development/versioning/git.nix` | `commitizen`, `serie`, `tig` |
| `home/apps/media/audio/vcv-rack.nix` | `vcv-rack` |
| `home/apps/media/design/blender.nix` | `blender` |
| `home/apps/media/design/figma.nix` | `figma-linux` |
| `home/apps/media/design/gimp.nix` | `gimp3-with-plugins` |
| `home/apps/media/design/inkscape.nix` | `inkscape` |
| `home/apps/media/graphic/default.nix` | `darktable`, `djv`, `exiv2`, `handbrake`, `kdePackages.kdenlive`, `mpv`, `obs-studio`, `vlc`, `yt-dlp` |
| `home/apps/media/graphic/imv.nix` | `imv` |
| `home/apps/media/graphic/oculante.nix` | `oculante` |
| `home/apps/media/graphic/swayimg.nix` | `swayimg` |
| `home/apps/media/servers/default.nix` | `plex`, `plexamp` |
| `home/apps/media/torrenting/default.nix` | `qbittorrent` |
| `home/apps/office/libreoffice.nix` | `libreoffice` |
| `home/apps/office/onlyoffice.nix` | `onlyoffice-desktopeditors` |
| `home/apps/office/slack.nix` | `slack` |
| `home/apps/office/teams.nix` | `teams-for-linux` |
| `home/apps/office/zoom.nix` | `zoom-us` |
| `home/apps/productivity/default.nix` | `libqalculate`, `qalculate-gtk`, `element`, `calcure`, `taskwarrior3`, `taskwarrior-tui`, `uair`, `pom`, `openpomodoro-cli`, `yad` |
| `home/apps/social/default.nix` | `weechat` |
| `home/apps/social/discord.nix` | `discordo`, `vesktop` |
| `home/apps/social/mastodon.nix` | `tut` |
| `home/apps/social/matrix.nix` | `element-call`, `element-desktop` |
| `home/apps/social/signal.nix` | `signal-desktop` |
| `home/apps/social/telegram.nix` | `telegram-desktop` |
| `home/apps/terminals/multiplexers/tmux/plugins.nix` | `tmuxPlugins.tmux-fzf` |
| `home/apps/utils/default.nix` | `gnome-disk-utility` |
| `home/desktop/common/default.nix` | `wl-mirror`, `wf-recorder` |
| `home/desktop/keyboard/kmonad.nix` | `kmonad` |
| `home/desktop/keyboard/wl-kbptr.nix` | `wl-kbptr` |
| `home/desktop/portals/default.nix` | `sassc`, `gtk-engine-murrine`, `gnome-themes-extra`, `adwaita-icon-theme`, `catppuccin-kvantum.override` |
| `home/desktop/wallpaper/swaybg.nix` | `swaybg` |
| `home/desktop/wm/niri.nix` | `wl-mirror` |
| `home/security/auth/password-managers.nix` | `pkgs._1password-gui`, `pkgs._1password-cli` |
| `home/security/encryption/default.nix` | `openssl` |
| `home/security/encryption/age-sops.nix` | `age`, `sops` |
| `home/security/encryption/gpg.nix` | `pass`, `gnupg` |
| `home/system/networking/vpn.nix` | `protonvpn-gui` |
| `home/utils/core/default.nix` | `nix-btm`, `nix-du`, `nix-melt`, `nix-output-monitor`, `nix-prefetch-github`, `nix-search`, `nix-top`, `nix-tree`, `nix-update`, `nix-web` |
| `home/utils/files/default.nix` | `desktop-file-utils`, `most`, `less`, `miller`, `tree`, `broot`, `rich-cli`, `csvkit`, `xlsx2csv`, `duckdb`, `ranger`, `xplr`, `visidata` |
| `home/utils/files/glow.nix` | `glow` |
| `home/utils/media/default.nix` | `chafa`, `timg`, `exiftool`, `ffmpegthumbnailer`, `imagemagick`, `libwebp`, `ueberzugpp` |
| `home/utils/misc/default.nix` | `via`, `cowsay`, `cmatrix`, `ascii`, `trash-cli` |
| `home/utils/misc/fastfetch.nix` | `fastfetch` |
| `home/utils/monitoring/default.nix` | `lnav`, `pv`, `hyperfine`, `ts`, `bandwhich`, `bmon` |
| `home/utils/monitoring/disks.nix` | `duf` |
| `home/utils/monitoring/processes.nix` | `procs`, `htop`, `glances`, `zenith` |
| `home/utils/monitoring/networking.nix` | `dogdns`, `gping`, `netscanner`, `termshark`, `trippy` |
| `home/utils/productivity/default.nix` | `grim`, `gtk3`, `hyprpicker`, `satty`, `slurp`, `swappy`, `tesseract`, `clipman`, `wl-clipboard`, `comma`, `fontforge`, `ghostscript`, `mermaid-cli`, `pandoc`, `poppler-utils`, `tui-journal`, `tealdeer`, `wikiman`, `bc`, `binutils`, `just`, `mask`, `mprocs`, `presenterm`, `hstr`, `ispell` |
| `home/utils/search/default.nix` | `fselect`, `plocate`, `repgrep`, `sd` |
| `home/virtualization/containers/docker.nix` | `docker` |
| `home/virtualization/vm/qemu.nix` | `qemu`, `kvmtool` |

## Optional/Dormant Modules To Consider Later

- ML module is imported but disabled: `autogen`, `dvc`, `llama-cpp`, `ollama`, `text-generation-webui`, `ggml-tools`, `huggingface-cli`, `haystack`, `whisper-cpp`, `comfyui`, `milvus`, `qdrant`.
- OpSec module is imported but disabled: `apktool`, `ghidra`, `radare2`, `aircrack-ng`, `hashcat`, `hydra`, `john`, `metasploit`, `autopsy`, `maltego`, `nmap`, `wpscan`, `kismet`, `snort`, `wireshark`, `burpsuite`, `kali-tools`, `lynis`, `nikto`, `sqlmap`, `wordlists`, `openvas`, `zaproxy`.
- Disabled app modules: Anytype, AppFlowy, Joplin, Logseq, Notion, Roam, Krusader, PCManFM, Cursor, Lapce, Thunderbird, LibreWolf, Qutebrowser, Alacritty, WezTerm, Kakoune, Neovide.
- Host `host_002` adds/differs: `alexandria`, Intel/NVIDIA Niri path, Steam/gaming, Avahi, Plex, Roon, Atuin sync server, HDMI autoswitch enabled, Intel WiFi Bluetooth coexistence fix.

<details>
<summary>Active import graph</summary>

- `hosts/host_001/default.nix`
- `hosts/host_001/hardware-configuration.nix`
- `modules/boot/boot.nix`
- `modules/services/default.nix`
- `modules/services/asus-backlight.nix`
- `modules/services/laptop-lid.nix`
- `modules/hardware/default.nix`
- `modules/hardware/audio.nix`
- `modules/hardware/battery.nix`
- `modules/hardware/bluetooth.nix`
- `modules/hardware/keyboard.nix`
- `modules/hardware/mouse.nix`
- `modules/hardware/network.nix`
- `modules/hardware/printers.nix`
- `modules/hardware/storage.nix`
- `modules/hardware/video.nix`
- `modules/shell/default.nix`
- `modules/security/default.nix`
- `modules/security/limits.nix`
- `modules/security/ssh.nix`
- `modules/security/sops.nix`
- `modules/security/sudo.nix`
- `modules/security/keyrings.nix`
- `modules/users/default.nix`
- `modules/manager/default.nix`
- `modules/manager/gdm.nix`
- `modules/manager/greetd.nix`
- `modules/desktop/default.nix`
- `modules/desktop/bar/default.nix`
- `modules/desktop/bar/waybar/default.nix`
- `modules/desktop/files/default.nix`
- `modules/desktop/files/thunar.nix`
- `modules/desktop/fonts/default.nix`
- `modules/desktop/notifications/default.nix`
- `modules/desktop/notifications/mako.nix`
- `modules/desktop/wm/niri/amd.nix`
- `modules/desktop/wm/niri/base.nix`
- `modules/integration/default.nix`
- `modules/integration/appimage.nix`
- `modules/integration/binaries.nix`
- `modules/integration/flatpak.nix`
- `modules/virtualization/default.nix`
- `modules/virtualization/vm-variants.nix`
- `modules/virtualization/docker-amd.nix`
- `modules/apps/default.nix`
- `modules/apps/browsers/default.nix`
- `modules/apps/editors/default.nix`
- `modules/apps/terminals/default.nix`
- `modules/rules/default.nix`
- `modules/rules/keychron.nix`
- `modules/rules/displays.nix`
- `modules/rules/wifi-adapter.nix`
- `modules/rules/bluetooth.nix`
- `modules/maintenance/default.nix`
- `modules/utils/default.nix`
- `modules/utils/core.nix`
- `modules/utils/filesystem.nix`
- `modules/utils/monitoring.nix`
- `modules/utils/networking.nix`
- `modules/utils/nix.nix`
- `modules/utils/text.nix`
- `modules/network/default.nix`
- `modules/network/atuin-server.nix`
- `modules/network/avahi.nix`
- `modules/network/plex.nix`
- `modules/network/roon.nix`
- `modules/network/tailscale-client.nix`
- `users/user_001/default.nix`
- `home/assets/themes/default.nix`
- `home/environment/default.nix`
- `home/environment/mime.nix`
- `home/modules/default.nix`
- `home/modules/assets.nix`
- `home/modules/desktop.nix`
- `home/modules/env.nix`
- `home/modules/fonts.nix`
- `home/modules/metadata.nix`
- `home/modules/osmium.nix`
- `home/modules/scripts.nix`
- `home/services/default.nix`
- `home/services/astal.nix`
- `home/services/brave.nix`
- `home/services/displays.nix`
- `home/services/eww.nix`
- `home/services/firefox.nix`
- `home/services/ghostty.nix`
- `home/services/keyring.nix`
- `home/services/kitty.nix`
- `home/services/kmonad.nix`
- `home/services/mako.nix`
- `home/services/neovim.nix`
- `home/services/swaybg.nix`
- `home/services/waybar.nix`
- `home/services/wezterm.nix`
- `home/services/wifi.nix`
- `home/services/wlsunset.nix`
- `home/apps/default.nix`
- `home/apps/browsers/default.nix`
- `home/apps/browsers/firefox.nix`
- `home/apps/browsers/librewolf.nix`
- `home/apps/browsers/qutebrowser.nix`
- `home/apps/browsers/zen.nix`
- `home/apps/docs/default.nix`
- `home/apps/docs/obsidian.nix`
- `home/apps/docs/okular.nix`
- `home/apps/docs/standardnotes.nix`
- `home/apps/docs/zathura.nix`
- `home/apps/editors/default.nix`
- `home/apps/editors/emacs.nix`
- `home/apps/editors/emacs/default.nix`
- `home/apps/editors/helix.nix`
- `home/apps/editors/helix/default.nix`
- `home/apps/editors/helix/languages.nix`
- `home/apps/editors/helix/settings.nix`
- `home/apps/editors/helix/themes.nix`
- `home/apps/editors/kakoune.nix`
- `home/apps/editors/kakoune/default.nix`
- `home/apps/editors/micro.nix`
- `home/apps/editors/neovide.nix`
- `home/apps/editors/nvim.nix`
- `home/apps/editors/nvim/default.nix`
- `home/apps/editors/nvim/modules/default.nix`
- `home/apps/editors/nvim/modules/coding.nix`
- `home/apps/editors/nvim/modules/editor.nix`
- `home/apps/editors/nvim/modules/lsp.nix`
- `home/apps/editors/nvim/modules/ui.nix`
- `home/apps/editors/nvim/modules/themes.nix`
- `home/apps/editors/nvim/modules/utils.nix`
- `home/apps/files/default.nix`
- `home/apps/files/thunar.nix`
- `home/apps/ides/default.nix`
- `home/apps/ides/rstudio.nix`
- `home/apps/ides/texmaker.nix`
- `home/apps/ides/vscode.nix`
- `home/apps/ides/vscode/default.nix`
- `home/apps/ides/vscode/settings.nix`
- `home/apps/ides/vscode/keybindings.nix`
- `home/apps/ides/vscode/profiles.nix`
- `home/apps/ides/zed.nix`
- `home/apps/ides/zed/default.nix`
- `home/apps/ides/zed/extensions.nix`
- `home/apps/ides/zed/keybinds.nix`
- `home/apps/ides/zed/languages.nix`
- `home/apps/ides/zed/settings.nix`
- `home/apps/ides/zed/theme-kanso.nix`
- `home/apps/mail/default.nix`
- `home/apps/mail/protonmail.nix`
- `home/apps/media/default.nix`
- `home/apps/media/audio/default.nix`
- `home/apps/media/audio/csound.nix`
- `home/apps/media/audio/ncmpc.nix`
- `home/apps/media/audio/ncspot.nix`
- `home/apps/media/audio/puredata.nix`
- `home/apps/media/audio/rmpc.nix`
- `home/apps/media/audio/sonicpi.nix`
- `home/apps/media/audio/spotify.nix`
- `home/apps/media/audio/supercollider.nix`
- `home/apps/media/audio/tidal.nix`
- `home/apps/media/audio/tidalcycles.nix`
- `home/development/default.nix`
- `home/development/agents/default.nix`
- `home/development/async/default.nix`
- `home/development/cloud/default.nix`
- `home/development/databases/default.nix`
- `home/development/infra/default.nix`
- `home/development/languages/default.nix`
- `home/development/languages/bash.nix`
- `home/development/languages/clojure.nix`
- `home/development/languages/cmake.nix`
- `home/development/languages/commonlisp.nix`
- `home/development/languages/cpp.nix`
- `home/development/languages/crystal.nix`
- `home/development/languages/csharp.nix`
- `home/development/languages/css.nix`
- `home/development/languages/deno.nix`
- `home/development/languages/dhall.nix`
- `home/development/languages/docker.nix`
- `home/development/languages/elixir.nix`
- `home/development/languages/elm.nix`
- `home/development/languages/emmet.nix`
- `home/development/languages/faust.nix`
- `home/development/languages/fennel.nix`
- `home/development/languages/fish.nix`
- `home/development/languages/fortran.nix`
- `home/development/languages/fsharp.nix`
- `home/development/languages/general.nix`
- `home/development/languages/glsl.nix`
- `home/development/languages/go.nix`
- `home/development/languages/graphql.nix`
- `home/development/languages/haskell.nix`
- `home/development/languages/java.nix`
- `home/development/languages/javascript.nix`
- `home/development/languages/jinja.nix`
- `home/development/languages/just.nix`
- `home/development/languages/julia.nix`
- `home/development/languages/kdl.nix`
- `home/development/languages/kotlin.nix`
- `home/development/languages/latex.nix`
- `home/development/languages/lua.nix`
- `home/development/languages/markdown.nix`
- `home/development/languages/nix.nix`
- `home/development/languages/ocaml.nix`
- `home/development/languages/perl.nix`
- `home/development/languages/php.nix`
- `home/development/languages/prisma.nix`
- `home/development/languages/protobuf.nix`
- `home/development/languages/python.nix`
- `home/development/languages/r.nix`
- `home/development/languages/rust.nix`
- `home/development/languages/scala.nix`
- `home/development/languages/sql.nix`
- `home/development/languages/svelte.nix`
- `home/development/languages/tailwind.nix`
- `home/development/languages/terraform.nix`
- `home/development/languages/toml.nix`
- `home/development/languages/typst.nix`
- `home/development/languages/vue.nix`
- `home/development/languages/xml.nix`
- `home/development/languages/yaml.nix`
- `home/development/languages/zig.nix`
- `home/development/misc/default.nix`
- `home/development/ml/default.nix`
- `home/development/opsec/default.nix`
- `home/development/versioning/default.nix`
- `home/development/versioning/git.nix`
- `home/apps/media/audio/vcv-rack.nix`
- `home/apps/media/design/default.nix`
- `home/apps/media/design/blender.nix`
- `home/apps/media/design/figma.nix`
- `home/apps/media/design/gimp.nix`
- `home/apps/media/design/inkscape.nix`
- `home/apps/media/graphic/default.nix`
- `home/apps/media/graphic/imv.nix`
- `home/apps/media/graphic/oculante.nix`
- `home/apps/media/graphic/swayimg.nix`
- `home/apps/media/servers/default.nix`
- `home/apps/media/torrenting/default.nix`
- `home/apps/office/default.nix`
- `home/apps/office/libreoffice.nix`
- `home/apps/office/onlyoffice.nix`
- `home/apps/office/slack.nix`
- `home/apps/office/teams.nix`
- `home/apps/office/zoom.nix`
- `home/apps/productivity/default.nix`
- `home/apps/social/default.nix`
- `home/apps/social/discord.nix`
- `home/apps/social/mastodon.nix`
- `home/apps/social/matrix.nix`
- `home/apps/social/signal.nix`
- `home/apps/social/telegram.nix`
- `home/apps/terminals/default.nix`
- `home/apps/terminals/emulators/default.nix`
- `home/apps/terminals/emulators/alacritty.nix`
- `home/apps/terminals/emulators/foot.nix`
- `home/apps/terminals/emulators/ghostty.nix`
- `home/apps/terminals/emulators/ghostty/default.nix`
- `home/apps/terminals/emulators/ghostty/general.nix`
- `home/apps/terminals/emulators/ghostty/theme.nix`
- `home/apps/terminals/emulators/kitty.nix`
- `home/apps/terminals/emulators/kitty/default.nix`
- `home/apps/terminals/emulators/kitty/settings.nix`
- `home/apps/terminals/emulators/kitty/themes/kanso.nix`
- `home/apps/terminals/emulators/wezterm.nix`
- `home/apps/terminals/prompts/default.nix`
- `home/apps/terminals/prompts/starship.nix`
- `home/apps/terminals/prompts/starship/default.nix`
- `home/apps/terminals/prompts/starship/core.nix`
- `home/apps/terminals/prompts/starship/custom-rhodium.nix`
- `home/apps/terminals/prompts/starship/format.nix`
- `home/apps/terminals/multiplexers/default.nix`
- `home/apps/terminals/multiplexers/tmux.nix`
- `home/apps/terminals/multiplexers/tmux/default.nix`
- `home/apps/terminals/multiplexers/tmux/plugins.nix`
- `home/apps/terminals/multiplexers/zellij.nix`
- `home/apps/utils/default.nix`
- `home/desktop/default.nix`
- `home/desktop/bars/default.nix`
- `home/desktop/bars/waybar.nix`
- `home/desktop/bars/waybar/modules/default.nix`
- `home/desktop/cursors/default.nix`
- `home/desktop/cursors/wayland-cursor.nix`
- `home/desktop/common/default.nix`
- `home/desktop/keyboard/default.nix`
- `home/desktop/keyboard/kmonad.nix`
- `home/desktop/keyboard/wl-kbptr.nix`
- `home/desktop/launchers/default.nix`
- `home/desktop/launchers/rofi.nix`
- `home/desktop/launchers/fuzzel.nix`
- `home/desktop/launchers/fuzzel/default.nix`
- `home/desktop/lockscreen/default.nix`
- `home/desktop/lockscreen/swaylock.nix`
- `home/desktop/lockscreen/hyprlock.nix`
- `home/desktop/notifications/default.nix`
- `home/desktop/notifications/dunst.nix`
- `home/desktop/notifications/mako.nix`
- `home/desktop/portals/default.nix`
- `home/desktop/widgets/default.nix`
- `home/desktop/wallpaper/default.nix`
- `home/desktop/wallpaper/swaybg.nix`
- `home/desktop/wm/default.nix`
- `home/desktop/wm/niri.nix`
- `home/desktop/wm/niri/default.nix`
- `home/security/default.nix`
- `home/security/auth/default.nix`
- `home/security/auth/password-managers.nix`
- `home/security/encryption/default.nix`
- `home/security/encryption/age-sops.nix`
- `home/security/encryption/gpg.nix`
- `home/security/network/default.nix`
- `home/security/network/ssh.nix`
- `home/shells/default.nix`
- `home/shells/bash.nix`
- `home/shells/fish.nix`
- `home/shells/fish/default.nix`
- `home/shells/fish/functions.nix`
- `home/shells/fish/shell-init.nix`
- `home/shells/fish/interactive-shell-init.nix`
- `home/shells/fish/aliases.nix`
- `home/shells/nushell.nix`
- `home/shells/nushell/default.nix`
- `home/shells/nushell/aliases.nix`
- `home/shells/nushell/env.nix`
- `home/shells/zsh.nix`
- `home/system/default.nix`
- `home/system/networking/default.nix`
- `home/system/networking/vpn.nix`
- `home/utils/default.nix`
- `home/utils/core/default.nix`
- `home/utils/core/direnv.nix`
- `home/utils/files/default.nix`
- `home/utils/files/bat.nix`
- `home/utils/files/glow.nix`
- `home/utils/files/nnn.nix`
- `home/utils/files/yazi.nix`
- `home/utils/files/yazi/modules/default.nix`
- `home/utils/media/default.nix`
- `home/utils/misc/default.nix`
- `home/utils/misc/fastfetch.nix`
- `home/utils/monitoring/default.nix`
- `home/utils/monitoring/disks.nix`
- `home/utils/monitoring/processes.nix`
- `home/utils/monitoring/bottom.nix`
- `home/utils/monitoring/btop.nix`
- `home/utils/monitoring/btop/default.nix`
- `home/utils/monitoring/btop/settings.nix`
- `home/utils/monitoring/btop/theme.nix`
- `home/utils/monitoring/networking.nix`
- `home/utils/monitoring/benchmarking.nix`
- `home/utils/productivity/default.nix`
- `home/utils/search/default.nix`
- `home/utils/search/atuin.nix`
- `home/utils/search/eza.nix`
- `home/utils/search/fzf.nix`
- `home/utils/search/skim.nix`
- `home/utils/search/television.nix`
- `home/virtualization/default.nix`
- `home/virtualization/containers/default.nix`
- `home/virtualization/containers/docker.nix`
- `home/virtualization/remote/default.nix`
- `home/virtualization/vm/default.nix`
- `home/virtualization/vm/qemu.nix`

</details>

## Evaluated Package Appendices

These are exact evaluated top-level package derivation names for `host_001`. They include package versions and Home Manager module outputs. Prefer the source package map for attr names when writing a new `home.packages` list.

<details>
<summary>System packages (280 entries, 204 unique)</summary>

- `mako-1.10.0`, `waybar-0.14.0`, `fd-10.3.0`
- `jq-1.8.1`, `ripgrep-15.1.0`, `ripgrep-all-0.10.10`
- `sd-1.0.0`, `yq-3.4.3`, `nil-2025-06-13`
- `nixd-2.7.0`, `nixfmt-1.1.0`, `curl-8.17.0`
- `bind-9.20.15`, `ipfetch-0-unstable-2024-02-02`, `wget-1.25.0`
- `wireless-tools-30.pre9`, `xh-0.25.3`, `bottom-0.11.4`
- `btop-1.4.5`, `mesa-demos-9.0.0`, `hyperfine-1.20.0`
- `nmon-16q`, `psmisc-23.7`, `lm-sensors-3.6.2`
- `dua-2.32.2`, `du-dust-1.2.3`, `eza-0.23.4`
- `file-5.45`, `gawk-5.3.2`, `lsof-4.99.5`
- `ncdu-2.9.2`, `p7zip-17.06`, `rar-7.12`
- `unzip-6.0`, `zip-3.0`, `zstd-1.5.7`
- `gdb-16.3`, `glib-2.86.2`, `gsettings-desktop-schemas-49.1`
- `libglvnd-1.7.0`, `glu-9.0.3`, `libva-2.22.0`
- `mesa-25.2.6`, `coreutils-9.8`, `util-linux-2.41.2`
- `uutils-coreutils-0.5.0`, `gnumake-4.4.1`, `gnutls-3.8.11`
- `gcc-wrapper-14.3.0`, `pkg-config-wrapper-0.29.2`, `git-2.51.2`
- `hwinfo-25.0`, `dmidecode-3.6`, `dool-1.3.8`
- `inxi-3.3.39-1`, `lshw-02.20`, `pciutils-3.14.0`
- `read-edid-3.0.2`, `smartmontools-7.5`, `upower-1.90.10`
- `usbutils-018`, `evtest-1.36`, `libinput-1.29.2`
- `alsa-utils-1.2.14`, `stress-1.0.7`, `kitty-0.44.0`
- `wl-clipboard-2.2.1`, `wayland-utils-1.2.0`, `wev-1.1.0`
- `wlr-randr-0.5.0`, `xwayland-satellite-0.8.1`, `dragon-drop-1.2.0`
- `libnotify-0.8.7`, `brightnessctl-0.5.1`, `ddcutil-2.2.3`
- `wdisplays-1.1.3`, `wlsunset-0.4.0`, `firewalld-2.4.0`
- `networkmanager-1.54.3`, `NetworkManager-openvpn-1.12.3`, `network-manager-applet-1.36.0`
- `wireguard-tools-1.0.20250521`, `wireguard-ui-0.6.2`, `openresolv-3.17.0`
- `xev-1.2.6`, `blueman-2.4.6`, `bluez-5.84`
- `bluez-tools-0-unstable-2020-10-24`, `acpi-1.8`, `pamixer-1.6`
- `pavucontrol-6.1`, `playerctl-2.4.1`, `wireplumber-0.5.12`
- `radeontop-1.4`, `xdg-utils-1.2.1`, `niri-25.11`
- `nixos-version`, `nixos-rebuild-ng-25.11`, `nixos-option`
- `nixos-install`, `nixos-generate-config`, `nixos-enter`
- `nixos-build-vms`, `docker-28.5.2`, `lvm2-2.03.35`
- `dosfstools-4.2`, `mtools-4.0.49`, `e2fsprogs-1.47.3`
- `cpupower-6.12.63`, `bcache-tools-1.1`, `systemd-258.2`
- `kmod-31`, `kexec-tools-2.0.32`, `nix-2.31.2`
- `nix-info`, `nix-bash-completions-0.6.8`, `dbus-1.14.10`
- `cups-2.4.15`, `cups-pk-helper-0.2.6`, `tailscale-1.90.9`
- `wpa_supplicant-2.11`, `modemmanager-1.24.0`, `iptables-1.8.11`
- `nixos-firewall-tool`, `nixos-icons-0-unstable-2025-06-28`, `udisks-2.10.2`
- `tumbler-4.20.1`, `pipewire-1.4.9`, `jack-libs`
- `gvfs-1.58.0`, `gnome-keyring-48.0`, `flatpak-1.16.1`
- `fuse-3.17.4`, `speech-dispatcher-0.12.1`, `sudo-1.9.17p2`
- `rtkit-0.13`, `polkit-126`, `linux-pam-1.7.1`
- `zsh-5.9`, `nix-zsh-completions-0.5.1`, `xfconf-4.20.0`
- `vim-9.1.1869`, `thunar-4.20.6`, `shadow-4.18.0`
- `ld-library-path`, `nix-index-0.1.9`, `neovim-0.11.5`
- `nano-8.7`, `less-679`, `fuse-2.9.9`
- `foot-1.25.0`, `fish-4.2.1`, `firefox-146.0.1`
- `dconf-0.49.0`, `appimage-run`, `man-db-2.13.1`
- `texinfo-interactive-7.2`, `nixos-configuration-reference-manpage`, `nixos-manual-html`
- `nixos-help`, `ltunify-0.3`, `solaar-1.1.16`
- `sound-theme-freedesktop-0.8`, `xdg-desktop-portal-1.20.3`, `xdg-desktop-portal-gtk-1.15.3`
- `xdg-desktop-portal-termfilechooser-1.2.1`, `xdg-desktop-portal-gnome-49.0`, `shared-mime-info-2.4`
- `hicolor-icon-theme-0.18`, `hostname-debian-3.25`, `iproute2-6.17.0`
- `iputils-20250605`, `openssh-10.2p1`, `acl-2.3.2`
- `attr-2.5.2`, `bash-interactive-5.3p3`, `bzip2-1.0.8`
- `coreutils-full-9.8`, `cpio-2.15`, `diffutils-3.12`
- `findutils-4.10.0`, `getent-glibc-2.40-66`, `getconf-glibc-2.40-66`
- `gnugrep-3.12`, `patch-2.8`, `gnused-4.9`
- `gnutar-1.35`, `gzip-1.14`, `xz-5.8.1`
- `libcap-2.77`, `ncurses-6.5`, `libressl-4.2.1`
- `mkpasswd-5.6.5`, `procps-4.0.4`, `time-1.9`
- `which-2.23`, `glibc-2.40-66`, `perl-5.40.0`
- `rsync-3.4.1`, `strace-6.18`, `glibc-locales-2.40-66`
- `X11-fonts`, `fontconfig-2.17.1`, `kbd-2.9.0`

</details>

<details>
<summary>Home packages (468 entries, 460 unique)</summary>

- `zen-twilight-1.18t`, `swayimg-4.6`, `oculante-0.9.2.1-unstable-2025-10-08`
- `imv-5.0.1`, `inkscape-1.4.2`, `gimp-with-plugins-3.0.4`
- `figma-linux-0.11.5`, `blender-5.0.1`, `spotify-1.2.74.477.g3be53afe`
- `qemu-10.1.2`, `kvmtool-0-unstable-2024-04-09`, `docker-28.5.2`
- `dogdns-unstable-2021-10-07`, `gping-1.20.1`, `netscanner-0.6.3`
- `termshark-2.4.0`, `trippy-0.13.0`, `procs-0.14.10`
- `htop-3.4.1`, `glances-4.3.3`, `zenith-0.14.1`
- `duf-0.9.1`, `fastfetch-2.55.1`, `glow-2.1.1`
- `protonvpn-gui-4.12.0`, `password-store-1.7.4`, `gnupg-2.4.8`
- `age-1.3.1`, `sops-3.11.0`, `1password-8.11.18`
- `1password-cli-2.32.0`, `python3.13-commitizen-4.9.1`, `serie-0.5.4`
- `tig-2.6.0`, `zig-0.15.2`, `zls-0.15.0`
- `yaml-language-server-1.19.2`, `lemminx-0.31.0`, `vue-language-server-3.1.4`
- `typst-0.14.0`, `tinymist-0.14.2`, `taplo-0.10.0`
- `terraform-ls-0.38.3`, `tailwindcss-language-server-0.14.28`, `svelte-language-server-0.17.21`
- `sqlfluff-3.5.0`, `sqlite-3.50.4`, `sqls-0.2.28`
- `metals-1.6.3`, `scalafmt-3.9.8`, `rustup-1.28.2`
- `bacon-3.20.1`, `cargo-info-0.7.7`, `rusty-man-0.5.0`
- `r-styler-1.10.3`, `r-languageserver-0.3.16`, `isort-6.0.1`
- `pyright-1.1.407`, `ruff-0.14.6`, `poetry-2.2.1`
- `python3-3.13.9-env`, `buf-1.59.0`, `prisma-6.18.0`
- `prisma-engines-6.18.0`, `intelephense-1.16.1`, `perlnavigator-0.6.3`
- `ocaml5.3.0-ocaml-lsp-server-1.23.1`, `ocaml5.3.0-ocamlformat-0.28.1`, `dune-3.20.2`
- `ocaml5.3.0-utop-2.16.0`, `ocaml5.3.0-ocp-indent-1.9.0`, `ocaml5.3.0-merlin-5.6-503`
- `nil-2025-06-13`, `nixd-2.7.0`, `nixfmt-1.1.0`
- `markdownlint-cli2-0.18.1`, `markdown-oxide-0.25.8`, `marksman-2024-12-18`
- `lua-language-server-3.15.0`, `stylua-2.3.1`, `texlab-5.24.0`
- `latexindent-3.24.5`, `texlive-combined-full-2025.20250703`, `kotlin-language-server-1.3.13`
- `kdlfmt-0.1.5`, `julia-1.12.1`, `just-1.43.1`
- `just-lsp-0.2.8`, `jinja-lsp-0.1.89`, `jinja2-cli-0.8.2`
- `nodejs-22.21.1`, `eslint-9.39.1`, `prettier-3.6.2`
- `typescript-language-server-5.1.3`, `biome-2.3.6`, `google-java-format-1.32.0`
- `jdt-language-server-1.52.0`, `haskell-language-server-2.12.0.0`, `fourmolu-0.19.0.1`
- `cabal-install-3.16.0.0`, `hoogle-unstable-2024-07-29`, `graphql-language-service-cli-3.5.0`
- `go-1.25.5`, `goimports-reviser-3.10.0`, `gopls-0.20.0`
- `gofumpt-0.9.2`, `gomodifytags-1.17.0`, `gotests-1.9.0`
- `gore-0.6.1`, `prettier-plugin-go-template-0.0.15-unstable-2023-07-26`, `glslls-0.5.0`
- `devenv-1.11.1`, `graphviz-12.2.1`, `prettierd-0.26.2`
- `rlwrap-0.46.2`, `socat-1.8.0.3`, `tree-sitter-0.25.10`
- `fsautocomplete-0.80.1`, `fortls-3.2.2`, `fprettify-0.3.7`
- `fish-lsp-1.0.10`, `fennel-ls-0.2.2`, `faust-2.79.3`
- `emmet-ls-0.4.1`, `elm-format-0.8.8`, `elm-language-server-2.8.0`
- `elixir-1.18.4`, `elixir-ls-0.30.0`, `erlang-language-platform-2025-07-21`
- `erlfmt-1.7.0`, `dockfmt-unstable-2020-09-18`, `dockerfile-language-server-0.15.0`
- `dhall-1.42.3`, `dhall-lsp-server-1.1.4`, `deno-2.5.6`
- `vscode-langservers-extracted-4.10.0`, `html-tidy-5.8.0`, `dart-sass-1.94.2`
- `omnisharp-roslyn-1.39.14`, `crystal-1.18.2`, `icr-0.9.0`
- `clang-tools-21.1.2`, `gcc-wrapper-14.3.0`, `gnumake-4.4.1`
- `sbcl-2.5.10`, `cmake-language-server-0.1.11`, `cmake-format-0.6.13`
- `clojure-lsp-2025.08.25-14.21.46`, `cljfmt-0.15.3`, `clj-kondo-2025.09.22`
- `bash-language-server-5.6.0`, `shfmt-3.12.0`, `shellcheck-0.11.0`
- `wl-mirror-0.18.3`, `swaybg-1.2.1`, `wl-kbptr-0.4.0`
- `kmonad-0.4.4`, `telegram-desktop-6.3.4`, `signal-desktop-7.83.0`
- `element-call-0.11.1`, `element-desktop-1.12.6`, `tut-2.0.1`
- `discordo-0-unstable-2025-11-17`, `vesktop-1.6.3`, `zoom-6.6.10.5815`
- `teams-for-linux-2.6.17`, `slack-4.47.72`, `onlyoffice-desktopeditors-9.1.0`
- `libreoffice-25.2.6.2-wrapped`, `qbittorrent-5.1.4`, `plexmediaserver-1.42.2.10156-f737b826c`
- `plexamp-4.13.0`, `darktable-5.2.1`, `djv-3.1.1`
- `exiv2-0.28.7`, `handbrake-1.10.2`, `kdenlive-25.08.3`
- `mpv-with-scripts-0.41.0`, `obs-studio-32.0.1`, `vlc-3.0.23-2`
- `yt-dlp-2025.12.08`, `clementine-1.4.1-58-gbae968a2f`, `easyeffects-8.0.9`
- `helvum-0.5.1`, `playerctl-2.4.1`, `cavalier-2024.1.0`
- `termusic-0.12.0`, `cmus-2.12.0`, `roon-tui-0.3.2`
- `roon-bridge-1.8-1125`, `protonmail-desktop-1.9.1`, `texmaker-6.0.1`
- `RStudio-2025.09.1+401`, `thunar-4.20.6`, `thunar-volman-4.20.0`
- `thunar-archive-plugin-0.6.0`, `standardnotes-3.195.13`, `okular-25.08.3`
- `obsidian-1.10.3`, `fselect-0.9.1`, `plocate-1.1.23`
- `repgrep-0.16.1`, `sd-1.0.0`, `grim-1.5.0`
- `gtk+3-3.24.51`, `hyprpicker-0.4.5`, `satty-0.20.0`
- `slurp-1.5.0`, `swappy-1.8.0`, `tesseract-5.5.1`
- `clipman-1.6.5`, `wl-clipboard-2.2.1`, `comma-2.3.3`
- `fontforge-20251009`, `ghostscript-with-X-10.06.0`, `mermaid-cli-11.12.0`
- `pandoc-cli-3.7.0.2`, `poppler-utils-25.10.0`, `tui-journal-0.16.1`
- `tealdeer-1.8.1`, `wikiman-2.14.1`, `bc-1.08.2`
- `binutils-wrapper-2.44`, `mask-0.11.6`, `mprocs-0.7.3`
- `presenterm-0.15.1`, `hstr-3.1`, `ispell-3.4.06`
- `lnav-0.13.2`, `pv-1.10.1`, `hyperfine-1.20.0`
- `ts-1.0.3`, `bandwhich-0.23.1`, `bmon-4.0`
- `via-3.0.0`, `cowsay-3.8.4`, `cmatrix-2.0`
- `ascii-3.30`, `trash-cli-0.24.5.26`, `chafa-1.18.0`
- `timg-1.6.3`, `perl5.40.0-Image-ExifTool-13.39`, `ffmpegthumbnailer-2.2.3`
- `imagemagick-7.1.2-9`, `libwebp-1.6.0`, `ueberzugpp-2.9.8`
- `desktop-file-utils-0.28`, `most-5.2.0`, `less-679`
- `miller-6.15.0`, `tree-2.2.1`, `broot-1.53.0`
- `rich-cli-1.8.0`, `csvkit-2.1.0`, `xlsx2csv-0.8.4`
- `duckdb-1.4.3`, `ranger-1.9.3-unstable-2025-11-14`, `xplr-1.0.1`
- `visidata-3.3`, `nix-btm-0.2.0`, `nix-du-1.2.3`
- `nix-melt-0.1.3`, `nix-output-monitor-2.1.8`, `nix-prefetch-github-7.1.0`
- `nix-search-0.4.0`, `nix-top-0.3.0`, `nix-tree-0.7.0`
- `nix-update-1.14.0`, `nix-web-0.4.2`, `openssl-3.6.0`
- `atac-0.22.1`, `jqp-0.8.0`, `fx-39.2.0`
- `terraform-1.14.0`, `k9s-0.50.16`, `kdash-0.6.2`
- `lazydocker-0.24.2`, `dive-0.13.1`, `ctop-0.7.7`
- `redis-8.2.3`, `postgresql-17.7`, `dbeaver-bin-25.2.5`
- `rainfrog-0.3.10`, `harlequin-2.4.1`, `gobang-0.1.0-alpha.5`
- `lazysql-0.4.3`, `awscli2-2.31.39`, `awslogs-0.15.0`
- `expect-5.45.4`, `codex-0.63.0`, `gemini-cli-0.17.1`
- `aider-chat-0.86.1`, `goose-cli-1.13.1`, `claude-code-2.1.74`
- `claude-monitor-3.1.0`, `sassc-3.6.2`, `gtk-engine-murrine-0.98.2`
- `gnome-themes-extra-3.28`, `adwaita-icon-theme-49.0`, `catppuccin-kvantum-0-unstable-2025-11-15`
- `wf-recorder-0.6.0`, `gnome-disk-utility-46.1`, `weechat-bin-env-4.8.0`
- `libqalculate-5.8.2`, `qalculate-gtk-5.8.2`, `element-1.0.1`
- `calcure-3.2.1`, `taskwarrior-3.4.2`, `taskwarrior-tui-0.26.4`
- `uair-0.6.3`, `pom-0.1.0-unstable-2024-05-17`, `openpomodoro-cli-0.3.0`
- `yad-14.1`, `aerc-0.21.0`, `filezilla-3.69.3`
- `celeste-0.8.3`, `brave-1.85.118`, `tor-0.4.8.21`
- `w3m-0.5.5`, `lynx-2.9.2`, `browsh-1.8.3`
- `seahorse-47.0.1`, `libsecret-0.21.7`, `vmtouch-1.3.1`
- `comfortaa-unstable-2021-07-29`, `dancing-script-2.0`, `oswald-4.103`
- `anonymouspro-1.002`, `cascadia-code-2407.24`, `nerd-fonts-caskaydia-cove-3.4.0+2407.24`
- `dejavu-fonts-2.37`, `nerd-fonts-dejavu-sans-mono-3.4.0+2.37`, `fantasque-sans-mono-1.8.0`
- `nerd-fonts-fantasque-sans-mono-3.4.0+1.8.0`, `fira-code-6.2`, `fira-code-symbols-20160811`
- `nerd-fonts-fira-code-3.4.0+6.2`, `fira-mono-3.2`, `nerd-fonts-fira-mono-3.4.0+3.206`
- `hack-font-3.003`, `nerd-fonts-hack-3.4.0+3.003`, `ibm-plex-1.1.0`
- `nerd-fonts-blex-mono-3.4.0+2.004-6.4.0-`, `inconsolata-3.001`, `nerd-fonts-inconsolata-3.4.0+3.000`
- `jetbrains-mono-2.304`, `nerd-fonts-jetbrains-mono-3.4.0+2.304`, `JuliaMono-ttf-0.061`
- `MapleMono-Variable-7.6`, `office-code-pro-1.004`, `paratype-pt-sans-2.005`
- `roboto-mono-3.001`, `nerd-fonts-roboto-mono-3.4.0+3.0`, `source-code-pro-2.042`
- `ubuntu-classic-0.83-6ubuntu2`, `victor-mono-1.5.6`, `commit-mono-1.143`
- `nerd-fonts-commit-mono-3.4.0+1.143`, `geist-font-1.5.0`, `nerd-fonts-geist-mono-3.4.0+1.401`
- `input-fonts-1.2`, `Iosevka-33.3.4`, `nerd-fonts-iosevka-3.4.0+33.2.1`
- `nerd-fonts-iosevka-term-3.4.0+33.2.1`, `nerd-fonts-iosevka-term-slab-3.4.0+33.2.1`, `nerd-fonts-zed-mono-3.4.0+1.2.0`
- `monaspace-1.301`, `nerd-fonts-monaspace-3.4.0+1.200`, `recursive-1.085`
- `nerd-fonts-recursive-mono-3.4.0+1.085`, `atkinson-hyperlegible-0-unstable-2021-04-29`, `cabin-1.005`
- `dosis-1.007`, `fira-4.301`, `inter-4.1`
- `lato-2.0`, `liberation-fonts-2.1.5`, `nerd-fonts-liberation-3.4.0+2.1.5`
- `montserrat-9.000`, `noto-fonts-2025.11.01`, `noto-fonts-cjk-sans-2.004`
- `noto-fonts-color-emoji-2.051`, `open-sans-1.11`, `overpass-3.0.5`
- `poppins-4.003`, `quicksand-2.0-unstable-2021-01-15`, `raleway-4.101`
- `roboto-3.012`, `source-sans-pro-3.006`, `work-sans-2.010`
- `alegreya-2.008`, `cardo-1.04`, `crimson-2014.10`
- `eb-garamond-0.016`, `garamond-libre-1.4`, `gelasio-0-unstable-2025-06-30`
- `lmodern-2.005`, `libre-baskerville-1.000`, `lora-3.021`
- `merriweather-2.005`, `source-serif-pro-3.001`, `vollkorn-4.105`
- `rhodium-fonts-1.0`, `firefox-146.0.1`, `zsh-5.9`
- `nix-zsh-completions-0.5.1`, `zoxide-0.9.8`, `zellij-0.43.1`
- `zed-editor-0.217.4`, `zathura-with-plugins-0.5.13`, `yazi-26.1.22`
- `waybar-0.14.0`, `vscode-1.106.2`, `tmux-3.6a`
- `television-0.13.10`, `starship-1.24.2`, `skim-0.20.5`
- `rofi-2.0.0`, `ripgrep-15.1.0`, `ripgrep-all-0.10.10`
- `nushell-0.108.0`, `neovim-0.11.5`, `ncmpcpp-0.10.1`
- `micro-2.0.14`, `man-db-2.13.1`, `lazygit-0.56.0`
- `kitty-0.44.0`, `jq-1.8.1`, `hyprlock-0.9.2`
- `evil-helix-20250915`, `gitui-0.27.0`, `git-2.51.2`
- `ghostty-1.2.3`, `gh-2.83.2`, `fzf-0.67.0`
- `fuzzel-1.13.1`, `foot-1.25.0`, `fish-4.2.1`
- `eza-0.23.4`, `emacs-with-packages-30.2`, `direnv-2.37.1`
- `delta-0.18.2`, `btop-1.4.5`, `bottom-0.11.4`
- `bat-0.26.1`, `atuin-18.10.0`, `mako-1.10.0`
- `shared-mime-info-2.4`, `dummy-xdg-mime-dirs1`, `dummy-xdg-mime-dirs2`
- `qtstyleplugins-unstable-2017-03-11`, `qt6gtk2-0.6`, `qtstyleplugin-kvantum5-1.1.5`
- `papirus-icon-theme-20250501`, `phinger-cursors-2.1`, `dummy-fc-dir1`
- `dummy-fc-dir2`, `home-configuration-reference-manpage`, `hm-session-vars.sh`
- `index.theme`

</details>

## State-Of-The-Art Mac Developer/Data Scientist Stack

This section is the recommended “do not merely copy Linux; make macOS excellent” layer. It keeps Rhodium’s keyboard-first, terminal-heavy feel while using the best native macOS tools where they are better than Linux equivalents.

### North Star Setup

- Use `nix-darwin` + Home Manager for reproducible CLI tools, shells, editors, language servers, Git, fonts, and dotfiles.
- Use Homebrew casks for polished GUI apps, menu bar tools, browser apps, commercial software, and macOS-specific productivity utilities.
- Use `Karabiner-Elements` as the keyboard foundation, `AeroSpace` as the tiling workspace manager, `Raycast` as the launcher/command palette, and `Hammerspoon` for glue automation.
- Keep the terminal cockpit centered on `Ghostty` or `Kitty`, `fish`, `starship`, `tmux`/`zellij`, `atuin`, `yazi`, `lazygit`, `btop`, `fzf`, `television`, `ripgrep`, `fd`, `eza`, and `bat`.
- Build the data science cockpit around `uv`, `pixi`, `ruff`, `pyright`, `marimo`, `jupyterlab`, `quarto`, `duckdb`, `polars`, `ibis`, `dbt`, `dvc`, `mlflow`, `wandb`, `ollama`, and `mlx`.

### Keyboard Shortcut Mapper

- `Karabiner-Elements`: best-in-class low-level macOS keyboard remapper; use it for Caps Lock hyper key, home-row mods, per-device rules, layer keys, and ergonomic symbol/navigation layers.
- `GokuRakuJoudo` / `goku`: declarative EDN config generator for Karabiner; this is the cleanest way to keep complex keyboard rules versioned in your dotfiles.
- `kanata`: excellent cross-platform keyboard remapper if you want one config shared between macOS/Linux; use it when Karabiner rules become too platform-specific.
- `BetterTouchTool`: best premium layer for trackpad gestures, mouse buttons, Touch Bar, window actions, app-specific shortcuts, and ergonomic non-keyboard automation.
- `skhd`: lightweight hotkey daemon; pair with `yabai` only if you accept SIP tradeoffs. With `AeroSpace`, prefer AeroSpace-native bindings plus Karabiner.
- Recommended pattern: `Caps Lock` → Hyper (`⌃⌥⇧⌘`), Hyper+letters for apps/workspaces, Hyper+H/J/K/L for focus, Hyper+Shift+H/J/K/L for moving windows, and hold-tap home-row mods only if typing remains comfortable.

### Window And Workspace Management

- `AeroSpace`: best current “Linux WM feeling” on macOS without disabling SIP; declarative config, workspaces, tiling layouts, monitor/workspace rules, and keyboard-first navigation.
- `yabai` + `skhd`: most powerful macOS tiling stack, but full power requires SIP changes; use only if you need advanced window manipulation beyond AeroSpace.
- `Rectangle Pro`: polished fallback for snap zones, throw actions, and conventional window resizing; useful even with AeroSpace for edge cases.
- `Moom`: elegant saved window layouts; good for presentation, meeting, and travel display profiles.
- `Hammerspoon`: Lua automation bridge for displays, windows, app launching, WiFi/location triggers, clipboard, menubar, and custom Rhodium-like workflows.
- `AltTab`: Windows/Linux-style window switcher; much better than stock Cmd-Tab when juggling many windows.
- `rcmd`: instant app switching by right-command + key; excellent if you assign single-key app mnemonics.
- `MonitorControl` or `Lunar`: external monitor brightness/volume control; closest replacement for Linux `brightnessctl`/`ddcutil` workflows.

### Launcher, Command Palette, And Automation

- `Raycast`: primary command palette; use it for app launch, clipboard history, snippets, window commands, calendar, GitHub, Jira/Linear, scripts, AI commands, and quicklinks.
- `Alfred`: still excellent for custom workflows; choose it over Raycast only if you prefer Alfred’s workflow ecosystem and local-first model.
- `Script Kit`: powerful JavaScript/TypeScript automation palette; ideal for custom developer workflows that outgrow Raycast scripts.
- `Shortcuts`: native macOS automation; use for system integrations, focus modes, calendar flows, and mobile/desktop handoff.
- `Keyboard Maestro`: premium automation monster for UI scripting, app macros, palettes, and contextual productivity flows.
- `Shottr` or `CleanShot X`: top-tier screenshots/OCR/annotation; replaces Rhodium screenshot scripts better than raw CLI tools.
- `Dropover`: shelf for drag-and-drop workflows; very useful for multi-window research and file triage.

### Terminal And CLI Cockpit

- Terminals: `Ghostty` as the elegant default, `Kitty` if you want maximum continuity with Rhodium, `WezTerm` if Lua-programmable terminal behavior matters.
- Shells: `fish` primary, `zsh` for macOS compatibility, `nushell` for structured data workflows.
- Prompt/history/navigation: `starship`, `atuin`, `zoxide`, `direnv`, `fzf`, `skim`, `television`, `carapace`, `nix-direnv`.
- Files/search: `yazi`, `broot`, `ranger`, `fd`, `ripgrep`, `ripgrep-all`, `ast-grep`, `sd`, `eza`, `bat`, `delta`, `dust`, `duf`, `dua`, `ncdu`.
- Git cockpit: `gh`, `lazygit`, `gitui`, `tig`, `serie`, `delta`, `commitizen`, `pre-commit`, `lefthook`, `git-cliff`.
- Process/system observability: `btop`, `bottom`, `procs`, `htop`, `hyperfine`, `oha`, `xh`, `doggo`/`dogdns`, `gping`, `trippy`, `termshark`.
- Data wrangling CLI: `jq`, `yq`, `dasel`, `miller`, `xsv`, `qsv`, `csvkit`, `duckdb`, `sqlite`, `visidata`, `pandoc`, `mermaid-cli`.

### Editors And Coding Experience

- `Zed`: fastest modern GUI editor; keep your existing Zed Kanso theme, Vim mode, language config, and AI-disabled/telemetry-disabled defaults unless work policy wants AI.
- `Neovim`: keep as the terminal power editor; port the existing plugin stack and Kanso theme exactly.
- `Cursor` or `Windsurf`: best AI-native IDEs for large-codebase agent workflows; use only if workplace policy allows cloud AI coding tools.
- `VS Code`: keep for extension compatibility, notebooks, remote dev, and enterprise workflows.
- `JetBrains Toolbox`: best-in-class heavyweight IDEs for PyCharm, DataGrip, IntelliJ, RustRover, GoLand, and database-heavy work.
- `DataGrip`: excellent database IDE; pair with `DBeaver`, `duckdb`, `lazysql`, `rainfrog`, and `harlequin` for GUI + TUI coverage.

### Data Science And ML Workbench

- Python environment management: `uv` for Python packages/tools, `pixi` for reproducible multi-language/data environments, `micromamba` only when Conda ecosystem compatibility is required.
- Python quality: `ruff`, `pyright`, `basedpyright`, `ty` when mature enough, `pytest`, `pytest-xdist`, `coverage`, `pre-commit`, `lefthook`.
- Interactive notebooks: `marimo` for reactive reproducible notebooks, `jupyterlab` for ecosystem compatibility, `quarto` for publishing, `nbstripout` and `jupytext` for clean Git history.
- Dataframes/query: `polars`, `duckdb`, `ibis`, `datafusion`, `pyarrow`, `connectorx`, `sqlglot`, `great-tables`.
- Visualization: `plotly`, `altair`, `matplotlib`, `seaborn`, `bokeh`, `vl-convert`, `kaleido`.
- ML experiment tracking: `mlflow`, `wandb`, `dvc`, `dvclive`, `lakefs`, `quilt`, `pachyderm` if you need heavier data lineage.
- LLM/local AI: `ollama`, `mlx`, `mlx-lm`, `llama.cpp`, `lm-studio`, `jan`, `open-webui`, `huggingface-cli`, `litellm`, `langfuse`.
- GPU/Apple Silicon: prefer Apple `mlx` and `tensorflow-metal`/`torch` MPS-aware workflows when local acceleration matters.
- Data apps: `streamlit`, `gradio`, `shiny`, `panel`, `evidence`, `observable-framework`.

### Cloud, Containers, And Infrastructure

- Runtime/tool versions: `mise` as a universal language/runtime manager; keep `direnv` + `nix-direnv` for project-specific shells.
- Containers: `OrbStack` is the best Docker Desktop replacement on macOS; faster, lighter, and includes Linux machines/Kubernetes support.
- Kubernetes: `k9s`, `kubectl`, `kubectx`, `kubens`, `helm`, `stern`, `kubecolor`, `kubeconform`, `kustomize`, `tilt`, `skaffold`.
- Infrastructure: `terraform`, `opentofu`, `terragrunt`, `terraform-ls`, `tflint`, `tfsec`/`trivy`, `infracost`, `pulumi`.
- Cloud CLIs: `awscli2`, `aws-vault`, `granted`, `saml2aws`, `gcloud`, `azure-cli`, `doctl`, `flyctl`, `vercel`, `railway`.
- HTTP/API: `bruno`, `insomnia`, `postman`, `httpie`, `xh`, `curlie`, `atac`, `hurl`, `grpcurl`, `buf`.

### Knowledge, Research, And Organization

- `Obsidian`: keep as the personal knowledge base; pair with Dataview, Tasks, Templater, Calendar, Excalidraw, Omnisearch, Git, and Periodic Notes.
- `Logseq`: optional if you want outliner-first research; do not duplicate too much with Obsidian.
- `Notion` or `Anytype`: team/project databases and polished dashboards; keep work/company policy in mind.
- `Linear`: best engineering task tracker if you control the workflow; otherwise integrate Jira/GitHub Issues in Raycast.
- `Things 3`: best native personal task manager on macOS; `Todoist` if cross-platform/team workflows matter more.
- `Akiflow` or `Motion`: calendar/time-blocking command center; choose one if your day is meeting/task heavy.
- `Reclaim.ai`: automated calendar defense and habit scheduling.
- `Readwise Reader`: best research/read-it-later pipeline; sync highlights into Obsidian.
- `Zotero`: best academic/reference manager; pair with Better BibTeX and Obsidian citations.
- `Hookmark`: deep links between files, emails, notes, calendar events, and tasks; excellent for research organization.

### Focus, Meetings, And Communication

- `Arc` or `Zen Browser`: work browser with spaces/profiles; keep Firefox/Brave for personal/privacy separation.
- `Mimestream`: best Gmail client on macOS if your work uses Google Workspace.
- `Superhuman`: premium email if speed and command palette matter more than local/native preferences.
- `Notion Calendar` or `Fantastical`: polished calendar layer; choose based on team ecosystem.
- `Dato`: menu bar calendar/time zones; excellent for distributed teams.
- `MeetingBar`: next meeting in menu bar with one-click join.
- `Krisp` or `macOS Voice Isolation`: meeting noise suppression.
- `Maccy` or Raycast Clipboard History: clipboard manager; use Raycast if you already rely on it.
- `Focus` modes + `HazeOver`/`Hidden Bar`/`Bartender`: reduce visual noise and menu bar clutter.

### Security, Secrets, And Work Hygiene

- `1Password` + `1Password CLI`: primary password/secrets workflow; integrate with SSH agent and shell plugins.
- `Touch ID for sudo`: configure via nix-darwin or PAM where possible for fast admin auth.
- `age`, `sops`, `gnupg`, `pass`: keep for repo secrets compatibility.
- `Little Snitch` or `LuLu`: outbound firewall/connection visibility; `Little Snitch` is the premium option.
- `Tailscale`: private mesh access; keep admin bookmarks from the Osmium registry.
- `ProtonVPN`: keep if personal/privacy VPN remains useful on the work machine and allowed by policy.
- `KnockKnock`, `BlockBlock`, `Suspicious Package`: excellent Mac security inspection utilities.

### Recommended Install Matrix

- Nix/Home Manager CLI: `fish`, `zsh`, `nushell`, `starship`, `tmux`, `zellij`, `atuin`, `zoxide`, `direnv`, `nix-direnv`, `fzf`, `skim`, `television`, `yazi`, `bat`, `eza`, `fd`, `ripgrep`, `ripgrep-all`, `ast-grep`, `sd`, `jq`, `yq`, `miller`, `xsv`, `qsv`, `duckdb`, `sqlite`, `visidata`, `btop`, `bottom`, `procs`, `hyperfine`, `gh`, `lazygit`, `gitui`, `delta`, `commitizen`, `pre-commit`, `lefthook`.
- Nix/Home Manager dev/data: `uv`, `pixi`, `ruff`, `pyright`, `pytest`, `poetry`, `nodejs`, `biome`, `deno`, `go`, `rustup`, `nil`, `nixd`, `nixfmt-rfc-style`, `terraform`, `terraform-ls`, `k9s`, `kubectl`, `helm`, `awscli2`, `ollama`, `huggingface-cli`, `dvc`, `mlflow`, `quarto`.
- Homebrew casks/native apps: `karabiner-elements`, `goku`, `bettertouchtool`, `aerospace`, `hammerspoon`, `raycast`, `rectangle-pro`, `alt-tab`, `rcmd`, `monitorcontrol`, `lunar`, `orbstack`, `ghostty`, `kitty`, `zed`, `visual-studio-code`, `cursor`, `jetbrains-toolbox`, `datagrip`, `docker` only if not using OrbStack, `1password`, `firefox`, `zen-browser`, `brave-browser`, `obsidian`, `zotero`, `readwise-reader`, `thingsmacsandbox`, `meetingbar`, `dato`, `shottr`, `cleanshot`, `dropover`, `little-snitch` or `lulu`.
- Optional premium layer: `Keyboard Maestro`, `BetterTouchTool`, `CleanShot X`, `Rectangle Pro`, `Moom`, `Hookmark`, `Things 3`, `Fantastical`, `Little Snitch`, `Superhuman`.

### Suggested Shortcut Architecture

- `Caps Lock`: Hyper key through `Karabiner-Elements`; tap sends `Esc`, hold sends `⌃⌥⇧⌘`.
- `Hyper + Space`: Raycast.
- `Hyper + Return`: terminal (`Ghostty` or `Kitty`).
- `Hyper + B/E/T/N/O/M`: browser, editor, terminal, notes, Obsidian, mail/messages.
- `Hyper + 1..9`: AeroSpace workspaces.
- `Hyper + H/J/K/L`: move focus left/down/up/right.
- `Hyper + Shift + H/J/K/L`: move focused window left/down/up/right.
- `Hyper + F`: fullscreen/zoom current window.
- `Hyper + C`: center/current window layout action.
- `Hyper + R`: reload AeroSpace/Hammerspoon/Raycast scripts.
- `Hyper + V`: clipboard history.
- `Hyper + S`: screenshot/OCR through Shottr or CleanShot X.

## MacBook Implementation Checklist

- Create `nix-darwin` host output for the MacBook and keep Home Manager modules for shells, terminal apps, Git, editors, fonts, themes, browsers, developer tools, and security tools.
- Split modules into `portable` and `linux-only`; do not import `modules/hardware`, `modules/desktop/wm/niri`, Linux `services`, udev rules, PipeWire, Waybar/Mako/Swaybg/Fuzzel/Rofi on macOS.
- Replace Linux clipboard/display/network commands in aliases/functions/scripts: `wl-copy` → `pbcopy`, `wl-paste` → `pbpaste`, NetworkManager scripts → `networksetup`/Shortcuts, Niri scripts → Aerospace/Yabai/skhd if desired.
- Move GUI apps that are better as native macOS apps to Homebrew casks while preserving names/config: 1Password, Firefox/Zen/Brave, Slack, Teams, Zoom, Spotify, Obsidian, Standard Notes, Proton apps, Zed, VS Code, Figma, Blender, GIMP, Inkscape, Signal, Telegram, Discord/Vesktop.
- Keep exact editor/shell dotconfig modules as the core of the port: Fish/Zsh/Nushell, Starship, Tmux/Zellij, Neovim, Zed, Git, Atuin, Direnv, Yazi, Bat/Eza/FZF/Television.
- Install enabled fonts first; the visual setup depends heavily on Nerd Fonts, Kanso/Chiaroscuro colors, `BerkeleyMonoRh Nerd Font`, `Work Sans`, and icon fonts.
- Recreate app/bookmark/Osmium registries only if you want Rhodium-style launch menus on macOS; otherwise port them as browser bookmarks or Raycast/Alfred entries.
