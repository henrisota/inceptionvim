{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
        javascript = [["prettierd" "prettier"]];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        javascript = ["eslint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        tsserver = {
          enable = true;
        };
      };
    };

    neotest = lib.mkIf config.plugins.neotest.enable {
      adapters = {
        jest = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        javascript
      ];
    };
  };
}
