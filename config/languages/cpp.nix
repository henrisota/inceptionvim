{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
        cpp = ["clang_format"];
        cmake = ["cmake_format"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        cpp = ["cppcheck"];
        cmake = ["cmakelint"];
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
        cpp
        cmake
      ];
    };
  };
}
