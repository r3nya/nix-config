# nix-config

Personal `nix-darwin` + Home Manager setup for macOS.

One `nix-darwin switch` applies:
- macOS system defaults
- Home Manager program config
- most app and CLI installs from Homebrew/App Store
- a small amount of Nix-managed config and fonts

## Structure

```
├── flake.nix           # Main flake (multi-host, Home Manager integrated)
├── darwin/
│   ├── configuration.nix
│   ├── homebrew.nix    # Most GUI apps and CLI tools, grouped by category
│   ├── system.nix      # macOS defaults
│   └── packages.nix    # System-level fonts
└── home/
    ├── home.nix
    ├── local.nix.example   # Personal overrides (git identity, machine-specific)
    ├── packages.nix        # Optional extra Nix-managed user packages
    └── programs/
        ├── default.nix     # Home Manager program imports
        ├── git.nix
        ├── neovim.nix
        ├── zsh.nix
        └── zsh/
            └── modules/    # Imported shell modules from the old .zsh repo
```

## Hosts

- `pa-m2` - MacBook Air M2
- `pp-m1` - MacBook Pro M1
- `wp-m4` - third configured macOS host

macOS exposes the local network hostname as `<host>.local` over Bonjour, so `hostname`
may print the `.local` form while the flake target remains `.#<host>`.

In `zsh`, the `#` in `.#<host>` is treated as a glob operator when `EXTENDED_GLOB` is on,
so quote or escape the flake ref when calling `nix` directly.

## Package Split

- `Homebrew`: most GUI apps, CLI tools, and shell plugin dependencies
- `darwin/homebrew.nix`: grouped into categories like browsers, communication, dev tools, CLI tools, and shell plugins
- `Nix / Home Manager`: macOS defaults, program config, fonts, and a few config-driven tools
- `masApps`: App Store installs

## Zsh Merge

- `home/programs/zsh/modules/` vendors the useful parts of `github.com/r3nya/.zsh`
- Home Manager still owns the top-level shell config in `home/programs/zsh.nix`
- the old custom prompt was not imported, so the current Starship prompt stays in place

## Bootstrap

```bash
# Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Restart shell
exec $SHELL

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Optional: personal overrides
cp home/local.nix.example home/local.nix

# Lock flake inputs
nix flake lock

# Apply config
nix run nix-darwin -- switch --flake '.#<host>'
```

Valid host targets:

```bash
nix run nix-darwin -- switch --flake '.#pa-m2'
nix run nix-darwin -- switch --flake '.#pp-m1'
nix run nix-darwin -- switch --flake '.#wp-m4'
```

If you derive the target from the machine itself, prefer `scutil --get LocalHostName` and
drop the `.local` suffix that `hostname` prints.

## Daily

```bash
# Rebuild current config
nd <host>

# Update inputs intentionally
nix flake update
```
