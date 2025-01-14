{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        xml = ["xmlformat" "xmllint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        lemminx = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        xml
      ];
    };
  };
}
