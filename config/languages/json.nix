{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        json = ["jq"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        json = ["jsonlint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        jsonls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        json
      ];
    };
  };
}
