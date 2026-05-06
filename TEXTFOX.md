# Textfox Installation (Declarative)

## 1. Add flake input

In `flake.nix`, add to `inputs`:

```nix
textfox = {
  url = "github:adriankarlen/textfox";
};
```

## 2. Add to outputs arguments

No changes needed. Rhodium's `flake.nix` already uses `} @ inputs:` in the
outputs function, so `textfox` is automatically available as `inputs.textfox`
after adding the input in Step 1.

<!-- If for some reason textfox needs to be explicitly destructured:
outputs = {
  self,
  nixpkgs,
  ...
  textfox,
} @ inputs:
-->

## 3. Import the Home Manager module

There are two valid approaches. Choose one:

### Option A: Import in the user's home module (official / recommended)

Since Rhodium already passes `inputs` via `extraSpecialArgs`, add the import
directly in the user module (e.g., `users/user_001/default.nix`):

```nix
{ inputs, ... }:
{
  imports = [
    inputs.textfox.homeManagerModules.default
    # ... other imports
  ];
}
```

This matches the approach recommended in the official Textfox README.

### Option B: Import via `sharedModules` in `flake.nix`

In each host's `home-manager` block inside `flake.nix`, add `sharedModules`:

```nix
home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;
  backupFileExtension = "backup";

  sharedModules = [
    inputs.textfox.homeManagerModules.default
  ];

  users.${userData.user_001.username or "user_001"} = import ./users/user_001;
  # ...
};
```

This also works and makes the module available to all users automatically.

## 4. Define a named Firefox profile

In `home/apps/browsers/firefox.nix`, add a profile:

```nix
{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.default = {
      name = "default";
      isDefault = true;
    };
  };
}
```

## 5. Enable and configure Textfox

In `home/apps/browsers/firefox.nix` (or a separate file):

```nix
textfox = {
  enable = true;
  profiles = [ "default" ];
  config = {
    displayWindowControls = false;
    displayNavButtons = false;
    displayUrlbarIcons = false;
    displaySidebarTools = true;
    displayTitles = true;

    font.family = ''"SF Mono", Consolas, monospace'';
    font.size = "14px";

    # Defaults: border.color = "var(--arrowpanel-border-color, --toolbar-field-background-color)"
    # Defaults: background.color = "var(--lwt-accent-color, -moz-dialog)"
    # Omit these to use the defaults, or set explicit values:
    # border.color = "#654321";
    # background.color = "#123456";
    border.width = "2px";
    border.radius = "0px";

    tabs.vertical.enable = true;
    tabs.horizontal.enable = false;

    newtabLogo = ""; # ASCII art

    extraConfig = '''
      /* custom CSS overrides */
    ''';
  };
};
```

## 6. Rebuild

```bash
just update-input textfox
just switch-fast host_001
```
