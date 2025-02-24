{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    lazy = {
      enable = false;
    };
  };
}
