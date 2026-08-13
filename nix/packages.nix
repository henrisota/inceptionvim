# Explicit package set, replacing Snowfall's packages/ auto-discovery.
#
# Snowfall called each packages/*/default.nix with a scope carrying `inputs`
# and `system` alongside nixpkgs, and injected the results as `pkgs.flak.*`.
# Both are reproduced here: packages/typr references `pkgs.flak.volt`, and
# overlays/vimPlugins lifts the whole set into `pkgs.vimPlugins`.
{
  pkgs,
  inputs,
  system,
  lib ? pkgs.lib,
}: let
  callPackage = pkgs.lib.callPackageWith (pkgs
    // {
      inherit inputs system lib pkgs;
    });
in rec {
  bufresize-nvim = callPackage ../packages/bufresize-nvim {};
  lsp-progress-nvim = callPackage ../packages/lsp-progress-nvim {};
  volt = callPackage ../packages/volt {};

  # typr reaches for `pkgs.flak.volt`, so it needs a pkgs carrying this set.
  typr = pkgs.lib.callPackageWith (pkgs
    // {
      inherit inputs system lib;
      pkgs = pkgs // {flak = {inherit volt;};};
    })
  ../packages/typr {};
}
