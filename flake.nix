{
  description = "flak plak";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
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
    typr = {
      url = "github:nvzone/typr";
      flake = false;
    };
    volt = {
      url = "github:nvzone/volt";
      flake = false;
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-darwin" "x86_64-linux"];

      perSystem = {system, ...}: let
        # The plugin packages are lifted into `pkgs.vimPlugins` by
        # overlays/vimPlugins, which the configuration modules read from.
        basePkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        flakPkgs = import ./nix/packages.nix {
          inherit inputs system;
          pkgs = basePkgs;
        };

        pkgs = basePkgs.extend (import ./overlays/vimPlugins {
          flak = flakPkgs;
        });
      in {
        _module.args.pkgs = pkgs;

        # Built against the overlaid pkgs, so the configuration modules find
        # the plugins under pkgs.vimPlugins.
        packages.default = pkgs.callPackage ./packages/inceptionvim {
          inherit inputs system;
        };

        # Snowfall discovered checks/ automatically; declared explicitly now.
        checks.inceptionvim = import ./checks/inceptionvim {
          inherit inputs system pkgs;
          inherit (pkgs) lib;
        };

        formatter = pkgs.alejandra;
      };
    };
}
