{
  config,
  lib,
  ...
}: {
  plugins = {
    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        html = {
          enable = true;
          extraOptions.settings = {
            html = {
              format = {
                templating = true;
                wrapLineLength = 120;
                wrapAttributes = "auto";
              };
              hover = {
                documentation = true;
                references = true;
              };
            };
          };
        };
        htmx = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        html
      ];
    };
  };
}
