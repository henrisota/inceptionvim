{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        java = ["google-java-format"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        java = ["checkstyle"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        java_language_server = {
          enable = true;
        };
      };
    };

    neotest = lib.mkIf config.plugins.neotest.enable {
      adapters = {
        java = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        java
      ];
    };
  };
}
