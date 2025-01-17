{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = typr;
    }
    {
      plugin = volt;
    }
  ];
}
