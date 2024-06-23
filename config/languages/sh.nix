{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    conform-nvim = lib.mkIf config.plugins.conform-nvim.enable {
      formattersByFt = {
        sh = ["shellcheck" "shellharden" "shfmt"];
      };
    };

    lint = lib.mkIf config.plugins.lint.enable {
      lintersByFt = {
        sh = ["shellcheck"];
      };
    };
  };
}
