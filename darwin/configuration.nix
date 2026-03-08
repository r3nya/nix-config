{ user, ... }:

{
  imports = [
    ./homebrew.nix
    ./system.nix
    ./packages.nix
  ];

  # Determinate manages the Nix installation and daemon on this machine.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  system.stateVersion = 5;
  system.primaryUser = user;

  programs.zsh.enable = true;

  environment.variables.EDITOR = "nvim";
}
