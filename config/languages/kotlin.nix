{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        kotlin = ["ktfmt"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        kotlin = ["ktlint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        kotlin_language_server = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        kotlin
      ];
    };
  };
}
