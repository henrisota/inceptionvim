{
  config,
  lib,
  ...
}: {
  # TODO: Configure debugging keymaps
  # https://github.com/kevinlmadison/nix-configs/blob/e09c4e1e52bc7f0d0d8a805bb986238cb8be55b3/home/nixvim/keymaps.nix#L231
  # https://github.com/hmajid2301/dotfiles/blob/750cc6323058720c9e2700c254cd69b8fe9da077/modules/home/cli/editors/nvim/plugins/debug.nix#L101
  # https://github.com/redyf/Neve/blob/cdd3342b011396ac0dc0a54ce76c28907422fa26/config/dap/nvim-dap.nix#L7
  keymaps = [];

  plugins = {
    dap = {
      enable = false;

      signs = {
        dapBreakpoint.text = " ";
        dapBreakpointCondition.text = " ";
        dapBreakpointRejected.text = " ";
        dapLogPoint.text = " ";
        dapStopped.text = "󰁕 ";
      };
    };

    dap-ui = {
      enable = false;

      settings = {
        controls = {
          enabled = true;
          element = "repl";
        };
        expandLines = true;
        force_buffers = true;
        layouts = [
          {
            elements = [
              {
                id = "stacks";
                size = 0.20;
              }
              {
                id = "scopes";
                size = 0.80;
              }
            ];
            position = "bottom";
            size = 20;
          }
          {
            elements = [
              {
                id = "repl";
                size = 0.80;
              }
              {
                id = "console";
                size = 0.20;
              }
            ];
            position = "bottom";
            size = 20;
          }
          {
            elements = [
              {
                id = "breakpoints";
                size = 0.50;
              }
              {
                id = "watches";
                size = 0.50;
              }
            ];
            position = "bottom";
            size = 20;
          }
        ];
      };
    };

    dap-virtual-text.enable = false;

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<Leader>d";
          group = " Debug";
        }
      ];
    };
  };
}
