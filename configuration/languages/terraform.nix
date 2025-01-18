{
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      settings.formatters_by_ft = {
        terraform-vars = ["terraform_fmt"];
        terraform = ["terraform_fmt"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        terraform-vars = ["tflint"];
        terraform = ["tflint"];
      };
    };

    lsp = lib.mkIf config.plugins.lsp.enable {
      servers = {
        terraformls = {
          enable = true;
        };
      };
    };

    treesitter = lib.mkIf config.plugins.treesitter.enable {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        terraform
        hcl
      ];
    };
  };
}
