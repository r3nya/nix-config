{ user, ... }:

{
  imports = [
    ./homebrew.nix
    ./system.nix
    ./packages.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  system.stateVersion = 5;

  nix.configureBuildUsers = true;

  programs.zsh.enable = true;

  environment.variables.EDITOR = "nvim";
}
