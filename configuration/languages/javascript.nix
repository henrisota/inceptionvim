{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        javascript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        ts_ls = {
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
