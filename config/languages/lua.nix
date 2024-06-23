{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
        lua = ["stylua"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        lua = ["luacheck"];
      };
      linters = {
        luacheck = {
          cmd = lib.getExe' pkgs.lua54Packages.luacheck "luacheck";
        };
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        lua-ls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        lua
        luadoc
        luap
      ];
    };
  };
}
