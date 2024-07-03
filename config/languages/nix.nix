{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    nix.enable = true;
    hmts.enable = true;
    nix-develop.enable = true;

    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
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
        nil-ls = {
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
