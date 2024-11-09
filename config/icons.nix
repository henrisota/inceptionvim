{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    web-devicons = {
      enable = true;
    };
  };
}
