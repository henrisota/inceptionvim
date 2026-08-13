{
  lib,
  inputs,
  system,
  pkgs,
  ...
}:
inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
  inherit pkgs;

  module = {
    imports = (import ../../nix/fs.nix {inherit lib;}).getNonDefaultNixFilesRecursive ../../configuration;

    config = {
      viAlias = true;
      vimAlias = true;
    };
  };
}
