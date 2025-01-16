{
  description = "flak plak";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bufresize-nvim = {
      url = "github:kwkarlwang/bufresize.nvim";
      flake = false;
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        root = ./.;
        namespace = "flak";
        meta = {
          name = "flak";
          title = "flak";
        };
      };
    };
  in
    lib.mkFlake {
      inherit inputs;
      src = ./.;

      alias = {
        packages = {
          default = "inceptionvim";
        };
      };

      package-namespace = "flak";
      channels-config = {
        allowUnfree = true;
      };
      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };
    };
}
