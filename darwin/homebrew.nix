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
    "antigravity"
    "claude-code"
    "codex"
    "codex-app"
    "ghostty"
    "httpie-desktop"
    "jetbrains-toolbox"
    "mitmproxy"
    "orbstack"
    "sublime-merge"
    "zed"
  ];

  productivityApps = [
    "bitwarden"
    "chatgpt"
    "claude"
    "obsidian"
    "proton-drive"
    "rectangle"
    "tailscale-app"
  ];

  utilityApps = [
    "imageoptim"
    "keka"
    "protonvpn"
    "transmission"
  ];

  fontCasks = [
    "font-iosevka"
    "font-jetbrains-mono"
  ];

  cliTools = [
    "btop"
    "cloc"
    "fd"
    "fzf"
    "gh"
    "htop"
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
    "Dato" = 1470584107;
    "uBlock Origin Lite" = 6745342698;
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
      ++ utilityApps
      ++ fontCasks;

    brews =
      cliTools
      ++ languageTools
      ++ shellPlugins
      ++ miscCli;

    masApps = appStoreApps;
  };
}
