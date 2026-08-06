{
  config,
  lib,
  ...
}: {
  plugins = {
    harpoon = {
      enable = true;

      enableTelescope = config.plugins.telescope.enable;

      settings = {
        settings = {
          save_on_toggle = true;
          sync_on_ui_close = true;
        };
      };
    };

    which-key = lib.mkIf (config.plugins.which-key.enable && config.plugins.harpoon.enable) {
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

  keymaps = lib.mkIf config.plugins.harpoon.enable (
    [
      {
        mode = "n";
        key = "<Leader>ha";
        action.__raw = "function() require('harpoon'):list():add() end";
        options = {
          silent = true;
          desc = "Harpoon add file";
        };
      }
      {
        mode = "n";
        key = "<Leader>he";
        action.__raw = "function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end";
        options = {
          silent = true;
          desc = "Harpoon toggle quick menu";
        };
      }
    ]
    ++ (lib.mapAttrsToList (key: index: {
        mode = "n";
        inherit key;
        action.__raw = "function() require('harpoon'):list():select(${toString index}) end";
        options = {
          silent = true;
          desc = "Harpoon file ${toString index}";
        };
      }) {
        "<Leader>hj" = 1;
        "<Leader>hk" = 2;
        "<Leader>hl" = 3;
        "<Leader>hm" = 4;
      })
  );
}
