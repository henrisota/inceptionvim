{
  config,
  lib,
  pkgs,
  ...
}: {
  keymaps = lib.optionals config.plugins.smart-splits.enable [
    {
      mode = "n";
      key = "<C-h>";
      action = "<cmd>lua require('smart-splits').move_cursor_left({ at_edge = 'stop' })<CR>";
      options = {
        desc = "Navigate left split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>lua require('smart-splits').move_cursor_down({ at_edge = 'stop' })<CR>";
      options = {
        desc = "Navigate down split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<cmd>lua require('smart-splits').move_cursor_up({ at_edge = 'stop' })<CR>";
      options = {
        desc = "Navigate up split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>lua require('smart-splits').move_cursor_right({ at_edge = 'stop' })<CR>";
      options = {
        desc = "Navigate right split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-\\\\>";
      action = "<cmd>lua require('smart-splits').move_cursor_previous())<CR>";
      options = {
        desc = "Navigate previous split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-h>";
      action = "<cmd>lua require('smart-splits').resize_left()<CR>";
      options = {
        desc = "Resize split left";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>lua require('smart-splits').resize_down()<CR>";
      options = {
        desc = "Resize split down";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>lua require('smart-splits').resize_up()<CR>";
      options = {
        desc = "Resize split up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-l>";
      action = "<cmd>lua require('smart-splits').resize_right()<CR>";
      options = {
        desc = "Resize split right";
        silent = true;
      };
    }
  ];
  plugins = {
    smart-splits = {
      enable = true;
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
        ignored_filetypes = [
          "neotree"
        ];
        log_level = "info";
        move_cursor_same_row = false;
        multiplexer_integration = true;
        resize_mode = {
          quit_key = "<ESC>";
          resize_keys = ["h" "j" "k" "l"];
          silent = false;
        };
      };
    };
  };
}
