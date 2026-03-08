# nix-config

Personal `nix-darwin` + Home Manager setup for macOS.

One `nix-darwin switch` applies:
- macOS system defaults
- Home Manager program config
- baseline CLI tools from Nix
- GUI apps from Homebrew/App Store

## Structure

```
├── flake.nix           # Main flake (multi-host, Home Manager integrated)
├── darwin/
│   ├── configuration.nix
│   ├── homebrew.nix    # GUI apps + App Store apps
│   ├── system.nix      # macOS defaults
│   └── packages.nix    # System-level fonts
└── home/
    ├── home.nix
    ├── local.nix.example   # Personal overrides (git identity, machine-specific)
    ├── packages.nix        # CLI/dev packages from Nix
    └── programs/
        ├── default.nix     # Home Manager program imports
        ├── git.nix
        ├── neovim.nix
        └── zsh.nix
```

## Hosts

- `air-m2` - MacBook Air M2
- `pro-m1` - MacBook Pro M1

## Package Split

- `Nix / Home Manager`: CLI tools, shell tooling, editor config, Git config
- `Homebrew`: GUI apps and a small number of macOS-specific utilities
- `masApps`: App Store installs

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

# Apply config (replace air-m2 with your host)
nix run nix-darwin -- switch --flake .#air-m2
```

## Daily

```bash
# Rebuild current config
nd .#air-m2

# Update inputs intentionally
nix flake update
```
