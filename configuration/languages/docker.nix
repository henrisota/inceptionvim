{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        docker = ["hadolint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        dockerls = {
          enable = true;
        };
        docker_compose_language_service = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        dockerfile
      ];
    };
  };
}
