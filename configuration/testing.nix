{
  config,
  lib,
  pkgs,
  ...
}: {
  keymaps =
    lib.optionals config.plugins.neotest.enable
    [
      {
        mode = "n";
        key = "<leader>at";
        action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
        options = {
          desc = "Test file";
          silent = true;
        };
      }
      # FIX: Look into alternative method or command
      # {
      #   mode = "n";
      #   key = "<leader>aT";
      #   action = "<cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>";
      #   options = {
      #     silent = true;
      #     desc = "Test all files";
      #   };
      # }
      {
        mode = "n";
        key = "<leader>ar";
        action = "<cmd>lua require('neotest').run.run()<CR>";
        options = {
          desc = "Test nearest";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>aS";
        action = "<cmd>lua require('neotest').stop()<CR>";
        options = {
          desc = "Stop tests";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>as";
        action = "<cmd>lua require('neotest').summary.toggle()<CR>";
        options = {
          desc = "Toggle test summary";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ao";
        action = "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>";
        options = {
          desc = "Show test output";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>aO";
        action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
        options = {
          desc = "Toggle test output";
          silent = true;
        };
      }
    ];

  plugins = {
    neotest = {
      enable = true;

      settings = {
        default_strategy = "integrated";
        diagnostic = {
          enabled = true;
          severity = "error";
        };
        discovery = {
          enabled = true;
          concurrent = 0;
        };
        log_level = "warn";
        output = {
          enabled = true;
          open_on_run = "short";
        };
        output_panel.enabled = true;
        quickfix.enabled = true;
        running.concurrent = true;
        state.enabled = true;
        status = {
          enabled = true;
          signs = true;
          virtual_text = true;
        };
        summary = {
          enabled = true;
          animated = true;
          expandErrors = true;
          follow = true;
        };
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<leader>a";
          group = "󰙨 Analyze";
        }
      ];
    };
  };
}
