{
  lib,
  inputs,
  pkgs,
  system,
}:
inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule {
  inherit pkgs;

  module = {
    imports = (import ../../nix/fs.nix {inherit lib;}).getNonDefaultNixFilesRecursive ../../packages/inceptionvim;
  };
}
