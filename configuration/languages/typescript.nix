{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        typescript = [["prettierd" "prettier"]];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        typescript = ["eslint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        eslint = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        typescript
      ];
    };
  };
}
