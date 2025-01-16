{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    harpoon = {
      enable = true;

      enableTelescope = config.plugins.telescope.enable;
      enterOnSendcmd = false;

      excludedFiletypes =
        [
          "checkhealth"
          "harpoon"
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

      keymaps = {
        addFile = "<leader>ha";
        toggleQuickMenu = "<leader>he";
        navFile = {
          "1" = "<leader>hj";
          "2" = "<leader>hk";
          "3" = "<leader>hl";
          "4" = "<leader>hm";
        };
      };

      keymapsSilent = true;
      markBranch = false;

      menu = {
        borderChars = ["─" "│" "─" "│" "╭" "╮" "╯" "╰"];
      };

      projects = {};

      saveOnChange = true;
      saveOnToggle = true;
      tmuxAutocloseWindows = false;
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<Leader>h";
          group = "Harpoon";
          icon = "󱡁 ";
        }
        {
          __unkeyed-1 = "<Leader>ha";
          group = "Add mark";
        }
        {
          __unkeyed-1 = "<Leader>he";
          group = "Toggle Quick Menu";
        }
      ];
    };
  };
}
