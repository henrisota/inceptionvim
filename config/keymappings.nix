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

      hidden = [
        "<silent>"
        "<cmd>"
        "<Cmd>"
        "<CR>"
        "^:"
        "^ "
        "^call "
        "^lua "
      ];
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

      motions = {
        count = true;
      };

      plugins = {
        marks = true;
        registers = true;
        presets = {
          g = true;
          motions = true;
          nav = true;
          operators = true;
          textObjects = true;
          windows = true;
          z = true;
        };
        spelling = {
          enabled = false;
          suggestions = 10;
        };
      };

      operators = {
        gc = "Comments";
      };

      showKeys = true;
      triggers = "auto";

      triggersBlackList = {
        i = ["j" "k"];
        v = ["j" "k"];
      };
      triggersNoWait = ["" "'" "g" "g'" "\"" "<c-r>" "z="];

      window = {
        margin = {
          bottom = 1;
          left = 0;
          right = 0;
          top = 1;
        };
        padding = {
          bottom = 1;
          left = 2;
          right = 2;
          top = 1;
        };
        position = "bottom";
        winblend = 0;
      };
    };
  };
}
