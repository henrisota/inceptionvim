{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        c = ["clang_format"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        c = ["cpplint"];
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
