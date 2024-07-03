{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
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
        tsserver = {
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
