{
  config,
  lib,
  pkgs,
  ...
}: {
  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };
}
