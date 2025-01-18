{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        bash = ["shellcheck" "shellharden" "shfmt"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        bash = ["shellcheck"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        bashls = {
          enable = true;
        };
      };
    };

    neotest = lib.mkIf config.plugins.neotest.enable {
      adapters = {
        bash = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
      ];
    };
  };
}
