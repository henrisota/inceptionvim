{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
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
