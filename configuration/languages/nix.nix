{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    nix.enable = false;
    hmts.enable = false;
    nix-develop.enable = false;

    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        nix = ["alejandra"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        nix = ["deadnix" "statix"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        nil_ls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        nix
      ];
    };
  };
}
