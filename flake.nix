{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{self, nixpkgs, ...}: {
    nixosConfigurations.amaterasu = nixpkgs.lib.nixosSystem {
      modules = [ ./machines/amaterasu ];
    };
  };
}
