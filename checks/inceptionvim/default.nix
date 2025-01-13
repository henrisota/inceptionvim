{
  inputs,
  pkgs,
  system,
}:
inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule {
  inherit pkgs;

  module = {
    imports = lib.snowfall.fs.get-non-default-nix-files-recursive ../../packages/inceptionvim;
  };
}
