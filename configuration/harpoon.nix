{
  config,
  lib,
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
        addFile = "<Leader>ha";
        toggleQuickMenu = "<Leader>he";
        navFile = {
          "1" = "<Leader>hj";
          "2" = "<Leader>hk";
          "3" = "<Leader>hl";
          "4" = "<Leader>hm";
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
