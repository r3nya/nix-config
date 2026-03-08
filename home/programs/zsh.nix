{ ... }:

{
  home.file.".config/zsh/modules" = {
    source = ./zsh/modules;
    recursive = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;

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
    };

    initExtra = ''
      nd() {
        if [ "$#" -eq 0 ]; then
          print -u2 "usage: nd <host>"
          return 1
        fi

        local flake="$1"
        if [[ "$flake" != *"#"* ]]; then
          flake=".#$flake"
        fi

        shift
        command nix run nix-darwin -- switch --flake "$flake" "$@"
      }

      for file in "$HOME"/.config/zsh/modules/*.zsh; do
        [ -f "$file" ] || continue
        source "$file"
      done
    '';

    history = {
      size = 50000;
      save = 50000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[=>](bold green)";
        error_symbol = "[=>](bold red)";
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
