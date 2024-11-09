{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        sql = ["sqlfluff"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        sql = ["sqlfluff"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        sqls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        sql
      ];
    };
  };
}
