{
  description = "nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nix-darwin, home-manager, ... }:
  let
    user = "r3nya";
    system = "aarch64-darwin";

    mkDarwin = hostname: nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit user hostname; };
      modules = [
        ./darwin/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user hostname; };
          home-manager.users.${user} = import ./home/home.nix;
        }
      ];
    };
  in
  {
    darwinConfigurations = {
      air-m2 = mkDarwin "air-m2";
      pro-m1 = mkDarwin "pro-m1";
    };
  };
}
