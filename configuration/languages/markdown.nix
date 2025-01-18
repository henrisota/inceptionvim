{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        markdown = ["mdformat"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        markdown = ["markdownlint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        marksman = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        markdown
        markdown_inline
      ];
    };
  };
}
