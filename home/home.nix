{ lib, user, ... }:

{
  imports =
    [
      ./programs
      ./packages.nix
    ]
    ++ lib.optional (builtins.pathExists ./local.nix) ./local.nix;

  home = {
    username = user;
    homeDirectory = "/Users/${user}";
    stateVersion = "24.11";
    
    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.home-manager.enable = true;

  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    theme = "system";
    default_agent = "plan";
    tui = {
      scroll_speed = 3;
      scroll_acceleration = {
        enabled = true;
      };
    };
  };
}
