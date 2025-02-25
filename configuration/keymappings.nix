_: {
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
          border = "single";
          padding = [1 1];
          wo.winblend = 0;
        };

        spec = [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>Q";
            __unkeyed-2 = "<Cmd>qa<CR>";
            desc = "Quit all open buffers";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>w";
            __unkeyed-2 = "<Cmd>w<CR>";
            desc = "Write current buffer";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>ww";
            __unkeyed-2 = "<Cmd>w!<CR>";
            desc = "Write current buffer forced";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>wq";
            __unkeyed-2 = "<Cmd>wq<CR>";
            desc = "Write current buffer and quit";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>wqq";
            __unkeyed-2 = "<Cmd>wq!<CR>";
            desc = "Write current buffer and quit forced";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "q:";
            __unkeyed-2 = "<Nop>";
            noremap = true;
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "q/";
            __unkeyed-2 = "<Nop>";
            noremap = true;
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "q?";
            __unkeyed-2 = "<Nop>";
            noremap = true;
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "Q";
            __unkeyed-2 = "<Nop>";
            noremap = true;
            silent = true;
          }
        ];
      };
    };
  };
}
