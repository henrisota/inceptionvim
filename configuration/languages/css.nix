{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        css = ["stylelint"];
        scss = ["stylelint"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        css = ["stylelint"];
        scss = ["stylelint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        cssls = {
          enable = true;
        };
        tailwindcss = {
          enable = false;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        css
      ];
    };
  };
}
