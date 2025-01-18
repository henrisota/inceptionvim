{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        rust = ["rustfmt"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        rust = ["clippy"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };

    neotest = lib.mkIf config.plugins.neotest.enable {
      adapters = {
        rust = {
          enable = true;
        };
      };
    };

    rustaceanvim = {
      enable = false;
      settings = {
        dap.autoload_configurations = true;
        server = {
          auto_attach = true;
          standalone = true;
        };
        tools = {
          enable_clippy = false;
          enable_nextest = false;
          reload_workspace_from_cargo_toml = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        rust
      ];
    };
  };
}
