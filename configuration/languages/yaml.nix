{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        yaml = ["yamlfmt"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        yaml = ["yamllint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        yamlls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        yaml
      ];
    };
  };
}
