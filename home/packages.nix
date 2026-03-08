{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    fd
    gh
    htop
    httpie
    jq
    nodejs
    pnpm
    ripgrep
    tmux
    tree
    wget
    yarn
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
  ];
}
