{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
        c = ["clang_format"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        c = ["cppcheck"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        ccls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        c
      ];
    };
  };
}
