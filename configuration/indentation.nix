{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          buftypes = [
            "terminal"
            "nofile"
            "quickfix"
          ];
          filetypes =
            [
              ""
              "checkhealth"
              "help"
              "netrw"
            ]
            ++ (lib.optional config.plugins.alpha.enable "alpha")
            ++ (lib.optionals config.plugins.cmp.enable ["cmp_menu" "cmp_docs"])
            ++ (lib.optional config.plugins.dashboard.enable "dashboard")
            ++ (lib.optional config.plugins.diffview.enable "Diffview*")
            ++ (lib.optional config.plugins.lsp.enable "lspinfo*")
            ++ (lib.optional config.plugins.neo-tree.enable "neo-tree")
            ++ (lib.optional config.plugins.noice.enable "noice")
            ++ (lib.optional config.plugins.notify.enable "notify")
            ++ (lib.optionals config.plugins.telescope.enable ["TelescopePrompt" "TelescopeResults"])
            ++ (lib.optional config.plugins.toggleterm.enable "toggleterm")
            ++ (lib.optional config.plugins.undotree.enable "undotree");
        };
        indent = {
          char = "│";
        };
        scope = lib.mkIf config.plugins.treesitter.enable {
          enabled = true;
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };

    indent-o-matic = {
      enable = true;
      settings = {
        max_lines = 65536;
        skip_multiline = false;
        standard_widths = [2 4 8];
      };
    };
  };
}
