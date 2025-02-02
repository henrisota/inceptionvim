{
  config,
  lib,
  ...
}: {
  keymaps = lib.optionals config.plugins.toggleterm.enable [
    {
      mode = ["n" "t"];
      key = "<Leader>tt";
      action = "<Cmd>ToggleTerm direction=float<CR>";
      options = {
        desc = "Toggle terminal";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>th";
      action = "<Cmd>ToggleTerm direction=horizontal<CR>";
      options = {
        desc = "Open terminal horizontally";
        silent = true;
      };
    }
  ];

  plugins = {
    toggleterm = {
      enable = true;

      settings = {
        auto_scroll = true;
        autochdir = false;
        close_on_exit = true;
        direction = "float";

        float_opts.border = "curved";

        hide_numbers = true;
        insert_mappings = true;
        persist_mode = true;
        persist_size = true;
        start_in_insert = true;
        terminal_mappings = true;

        winbar = {
          enabled = false;
        };
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<Leader>t";
          group = "󱡁 Terminal";
        }
      ];
    };
  };
}
