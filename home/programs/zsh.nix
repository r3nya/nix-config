{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -la";
      la = "ls -A";
      nv = "nvim";
      lg = "lazygit";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph";

      nd = "nix run nix-darwin -- switch --flake";
    };

    initExtra = ''
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_SPACE
      setopt HIST_EXPIRE_DUPS_FIRST
      setopt SHARE_HISTORY
    '';

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      directory = {
        truncation_length = 3;
        fish_style_pwd_dir_length = 1;
      };
      git_branch = {
        symbol = " ";
      };
      nodejs = {
        symbol = " ";
      };
      rust = {
        symbol = " ";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
