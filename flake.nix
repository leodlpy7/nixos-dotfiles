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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, sops-nix, nix-easyroam, nixvim, ...}:
    let
      nixvimFor = pkgs: {
        inherit pkgs;
        module = import ./modules/nixvim-okami;
      };
      inherit (self) outputs;
    in
    {
      # define the system config
      nixosConfigurations.amaterasu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs outputs; };
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
      # create a nixvim standalone
      packages.nixvim-okami = nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule (
        nixvimFor nixpkgs.legacyPackages.x86_64-linux
      );
    };
}
