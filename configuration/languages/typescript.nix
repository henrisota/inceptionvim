{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        typescript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        typescript = ["eslint_d"];
        typescriptreact = ["eslint_d"];
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
