_: {
  keymaps = [
    {
      mode = "n";
      key = "<Leader>Q";
      action = "<Cmd>qa<CR>";
      options = {
        desc = "Quit all open buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>w";
      action = "<Cmd>w<CR>";
      options = {
        desc = "Write current buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>ww";
      action = "<Cmd>w!<CR>";
      options = {
        desc = "Write current buffer forced";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>wq";
      action = "<Cmd>wq<CR>";
      options = {
        desc = "Write current buffer and quit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Leader>wqq";
      action = "<Cmd>wq!<CR>";
      options = {
        desc = "Write current buffer and quit forced";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "q:";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "q/";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "q?";
      action = "<Nop>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "Q";
      action = "<Nop>";
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
        triggers_no_wait = ["" "'" "g" "g'" "\"" "<C-r>" "z="];
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
