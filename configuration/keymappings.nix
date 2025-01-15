{
  config,
  lib,
  pkgs,
  ...
}: {
  keymaps = [
    {
      mode = "n";
      key = "<leader>Q";
      action = "<cmd>qa<CR>";
      options = {
        desc = "Quit all open buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<CR>";
      options = {
        desc = "Write current buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ww";
      action = "<cmd>w!<CR>";
      options = {
        desc = "Write current buffer forced";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wq";
      action = "<cmd>wq<CR>";
      options = {
        desc = "Write current buffer and quit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wqq";
      action = "<cmd>wq!<CR>";
      options = {
        desc = "Write current buffer and quit forced";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "q:";
      action = "<NOP>";
      options = {
        silent = true;
      };
    }
    {
      mode = "n";
      key = "Q";
      action = "<NOP>";
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];

  plugins = {
    which-key = {
      enable = true;

      settings = {
        ignoreMissing = false;

        icons = {
          breadcrumb = "»";
          group = "+";
          separator = "➜";
        };

        layout = {
          align = "left";
          height = {
            min = 4;
            max = 25;
          };
          width = {
            min = 20;
            max = 50;
          };
          spacing = 3;
        };
        plugins = {
          presets = {
            g = true;
            motions = true;
            nav = true;
            operators = true;
            textObjects = true;
            windows = true;
            z = true;
          };
          registers = true;
          spelling = {
            enabled = false;
            suggestions = 10;
          };
        };
        show_keys = true;
        triggers_no_wait = ["" "'" "g" "g'" "\"" "<c-r>" "z="];
        triggers_black_list = {
          i = ["j" "k"];
          v = ["j" "k"];
        };
        win = {
          padding = [1 2];
          wo.winblend = 0;
        };
      };
    };
  };
}
