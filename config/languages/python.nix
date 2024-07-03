{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
        python = ["isort" "ruff_fix" "ruff_format"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        python = ["ruff"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        pyright = {
          enable = true;
        };
      };
    };

    neotest = lib.mkIf config.plugins.neotest.enable {
      adapters = {
        python = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        python
      ];
    };
  };
}
