{
  config,
  lib,
  ...
}: {
  keymaps =
    lib.optionals config.plugins.neotest.enable
    [
      {
        mode = "n";
        key = "<Leader>at";
        action = "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
        options = {
          desc = "Test file";
          silent = true;
        };
      }
      # FIX: Look into alternative method or command
      # {
      #   mode = "n";
      #   key = "<Leader>aT";
      #   action = "<Cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>";
      #   options = {
      #     silent = true;
      #     desc = "Test all files";
      #   };
      # }
      {
        mode = "n";
        key = "<Leader>ar";
        action = "<Cmd>lua require('neotest').run.run()<CR>";
        options = {
          desc = "Test nearest";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Leader>aS";
        action = "<Cmd>lua require('neotest').stop()<CR>";
        options = {
          desc = "Stop tests";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Leader>as";
        action = "<Cmd>lua require('neotest').summary.toggle()<CR>";
        options = {
          desc = "Toggle test summary";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Leader>ao";
        action = "<Cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>";
        options = {
          desc = "Show test output";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Leader>aO";
        action = "<Cmd>lua require('neotest').output_panel.toggle()<CR>";
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
          __unkeyed-1 = "<Leader>a";
          group = "󰙨 Analyze";
        }
      ];
    };
  };
}
