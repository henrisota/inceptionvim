_: {
  plugins = {
    which-key = {
      enable = true;

      settings = {
        ignoreMissing = false;

        icons = {
          breadcrumb = "»";
          group = "";
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
            __unkeyed-1 = "<Leader>q";
            __unkeyed-2 = "<Cmd>qa<CR>";
            desc = "Quit all open buffers";
            noremap = true;
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>w";
            __unkeyed-2 = "<Cmd>w<CR>";
            desc = "Write current buffer";
            noremap = true;
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>ww";
            __unkeyed-2 = "<Cmd>w!<CR>";
            desc = "Write current buffer forced";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v" "x"];
            __unkeyed-1 = "<C-a>";
            __unkeyed-2 = "gg0vG$";
            desc = "Select all";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v" "x"];
            __unkeyed-1 = "<Leader>y";
            __unkeyed-2 = "\"+y";
            desc = "Copy";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v" "x"];
            __unkeyed-1 = "<Leader>yy";
            __unkeyed-2 = "\"+Y";
            desc = "Copy line";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v" "x"];
            __unkeyed-1 = "<Leader>Y";
            __unkeyed-2 = "\"+yy";
            desc = "Copy line";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v"];
            __unkeyed-1 = "<Leader>d";
            __unkeyed-2 = "\"+d";
            desc = "Delete";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v"];
            __unkeyed-1 = "<Leader>D";
            __unkeyed-2 = "\"+D";
            desc = "Delete line";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v"];
            __unkeyed-1 = "<Leader>p";
            __unkeyed-2 = "\"+p";
            desc = "Paste";
            noremap = true;
            silent = true;
          }
          {
            mode = ["n" "v"];
            __unkeyed-1 = "<Leader>P";
            __unkeyed-2 = "\"+P";
            desc = "Paste before";
            noremap = true;
            silent = true;
          }
          {
            mode = ["x"];
            __unkeyed-1 = "<Leader>P";
            __unkeyed-2 = "\"_dP";
            desc = "Paste without erasing";
            noremap = true;
            silent = true;
          }
          {
            mode = ["i"];
            __unkeyed-1 = "<C-p>";
            __unkeyed-2 = "<C-r><C-p>+";
            desc = "Paste";
            noremap = true;
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
            __unkeyed-1 = "q";
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
