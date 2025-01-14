{
  lib,
  inputs,
  system,
  pkgs,
  ...
}:
inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
  inherit pkgs;
  extraSpecialArgs = {};

  module = {
    imports = lib.snowfall.fs.get-non-default-nix-files-recursive ../../configuration;

    config = {
      viAlias = true;
      vimAlias = true;
    };
  };
}
