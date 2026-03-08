{ ... }:

let
  browsers = [
    "brave-browser"
    "firefox"
  ];

  communicationApps = [
    "element"
    "signal"
    "telegram"
    "zoom"
  ];

  developerApps = [
    "ghostty"
    "orbstack"
    "zed"
  ];

  productivityApps = [
    "bitwarden"
    "chatgpt"
    "claude"
    "obsidian"
    "proton-drive"
    "rectangle"
    "tailscale"
  ];

  utilityApps = [
    "imageoptim"
    "keka"
    "transmission"
  ];

  cliTools = [
    "btop"
    "cloc"
    "fd"
    "fzf"
    "gh"
    "htop"
    "httpie"
    "jq"
    "ripgrep"
    "tmux"
    "tree"
    "wget"
  ];

  languageTools = [
    "asdf"
    "node"
    "pnpm"
    "yarn"
  ];

  shellPlugins = [
    "zsh-autosuggestions"
    "zsh-history-substring-search"
    "zsh-syntax-highlighting"
  ];

  miscCli = [
    "kimi-cli"
  ];

  appStoreApps = {
    "Dato" = 1472587095;
    "uBlock Origin" = 1437421616;
  };
in
{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = false;
      upgrade = false;
    };

    casks =
      browsers
      ++ communicationApps
      ++ developerApps
      ++ productivityApps
      ++ utilityApps;

    brews =
      cliTools
      ++ languageTools
      ++ shellPlugins
      ++ miscCli;

    masApps = appStoreApps;
  };
}
