{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = false;
      upgrade = false;
    };

    casks = [
      "ghostty"
      "zed"
      "brave-browser"
      "firefox"
      "bitwarden"
      "obsidian"
      "telegram"
      "signal"
      "rectangle"
      "orbstack"
      "proton-drive"
      "tailscale"
      "chatgpt"
      "element"
      "claude"
      "imageoptim"
      "keka"
      "transmission"
      "zoom"
    ];

    brews = [
      "kimi-cli"
      "asdf"
    ];

    masApps = {
      "uBlock Origin" = 1437421616;
      "Dato" = 1472587095;
    };
  };
}
