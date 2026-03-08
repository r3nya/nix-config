{ lib, hostname, ... }:

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

  hostCasks = lib.optionals (hostname == "wp-m4") [
    "1password"
    "gpg-suite"
    "ngrok"
    "session-manager-plugin"
    "slack"
  ];

  cliTools = [
    "ack"
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

  hostBrews = lib.optionals (hostname == "wp-m4") [
    "awscli"
  ];

  appStoreApps = {
    "Dato" = 1470584107;
    "uBlock Origin Lite" = 6745342698;
  } // lib.optionalAttrs (hostname == "wp-m4") {
    "1Password for Safari" = 1569813296;
    "Yubico Authenticator" = 1497506650;
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
      ++ fontCasks
      ++ hostCasks;

    brews =
      cliTools
      ++ languageTools
      ++ shellPlugins
      ++ miscCli
      ++ hostBrews;

    masApps = appStoreApps;
  };
}
