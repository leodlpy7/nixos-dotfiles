{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-easyroam = {
      url = "github:0x5a4/nix-easyroam";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, sops-nix, nix-easyroam, ...}: {
    nixosConfigurations.amaterasu = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      	./machines/amaterasu
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            users.leo = import ./home/leo/default.nix;
          };
        }
        sops-nix.nixosModules.sops
        nix-easyroam.nixosModules.nix-easyroam
      ];
    };
  };
}
