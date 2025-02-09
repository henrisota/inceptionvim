{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = bufresize-nvim;
      config = ''lua require('bufresize').setup()'';
    }
    {
      plugin = navigator-nvim;
      config = ''lua require('Navigator').setup()'';
    }
  ];

  extraConfigLua = lib.optionalString config.plugins.smart-splits.enable ''
    require('smart-splits').setup({
      resize_mode = {
        hooks = {
          on_leave = require('bufresize').register,
        },
      },
    })
  '';

  keymaps =
    (lib.optionals config.plugins.smart-splits.enable [
      {
        mode = "n";
        key = "<C-h>";
        action = "<Cmd>lua require('smart-splits').move_cursor_left({ at_edge = 'stop' })<CR>";
        options = {
          desc = "Navigate left split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<Cmd>lua require('smart-splits').move_cursor_down({ at_edge = 'stop' })<CR>";
        options = {
          desc = "Navigate down split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<Cmd>lua require('smart-splits').move_cursor_up({ at_edge = 'stop' })<CR>";
        options = {
          desc = "Navigate up split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<Cmd>lua require('smart-splits').move_cursor_right({ at_edge = 'stop' })<CR>";
        options = {
          desc = "Navigate right split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-\\\\>";
        action = "<Cmd>lua require('smart-splits').move_cursor_previous())<CR>";
        options = {
          desc = "Navigate previous split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<A-h>";
        action = "<Cmd>lua require('smart-splits').resize_left()<CR>";
        options = {
          desc = "Resize split left";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<A-j>";
        action = "<Cmd>lua require('smart-splits').resize_down()<CR>";
        options = {
          desc = "Resize split down";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<Cmd>lua require('smart-splits').resize_up()<CR>";
        options = {
          desc = "Resize split up";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<A-l>";
        action = "<Cmd>lua require('smart-splits').resize_right()<CR>";
        options = {
          desc = "Resize split right";
          silent = true;
        };
      }
    ])
    ++ [
      {
        mode = "n";
        key = "<C-h>";
        action = "<Cmd>NavigatorLeft<CR>";
        options = {
          desc = "Navigate left split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<Cmd>NavigatorDown<CR>";
        options = {
          desc = "Navigate down split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<Cmd>NavigatorUp<CR>";
        options = {
          desc = "Navigate up split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<Cmd>NavigatorRight<CR>";
        options = {
          desc = "Navigate right split";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-\\\\>";
        action = "<Cmd>NavigatorPrevious<CR>";
        options = {
          desc = "Navigate previous split";
          silent = true;
        };
      }
    ];

  plugins = {
    smart-splits = {
      enable = false;
      settings = {
        at_edge = "stop";
        default_amount = 3;
        disable_multiplexer_nav_when_zoomed = true;
        float_win_behavior = "previous";
        ignored_buftypes = [
          "nofile"
          "quickfix"
          "prompt"
        ];
        ignored_events = [
          "BufEnter"
          "WinEnter"
        ];
        ignored_filetypes = lib.optional config.plugins.neo-tree.enable "neotree";
        log_level = "info";
        move_cursor_same_row = false;
        multiplexer_integration = true;
        resize_mode = {
          quit_key = "<Esc>";
          resize_keys = ["h" "j" "k" "l"];
          silent = true;
        };
      };
    };
  };
}
