{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        helm-ls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        helm
      ];
    };
  };
}
