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
    lsp-progress-nvim = {
      url = "github:linrongbin16/lsp-progress.nvim";
      flake = false;
    };
    navigator-nvim = {
      url = "github:dynamotn/Navigator.nvim";
      flake = false;
    };
    typr = {
      url = "github:nvzone/typr";
      flake = false;
    };
    volt = {
      url = "github:nvzone/volt";
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
