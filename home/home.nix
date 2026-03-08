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

  home.file.".config/opencode/config.json".text = builtins.toJSON {
    model = "anthropic/claude-3.5-sonnet";
  };
}
