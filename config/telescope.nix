{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    telescope = {
      enable = true;

      extensions = {
        fzf-native.enable = true;
      };

      keymaps = {
        "<leader>ff" = {
          mode = "n";
          action = "find_files hidden=true";
          options = {
            desc = "Find files";
            silent = true;
          };
        };
        "<leader>fg" = {
          mode = "n";
          action = "live_grep";
          options = {
            desc = "Find in files";
            silent = true;
          };
        };
        "<leader>fz" = {
          mode = "n";
          action = "current_buffer_fuzzy_find";
          options = {
            desc = "Find in current buffer";
            silent = true;
          };
        };
        "<leader>fr" = {
          mode = "n";
          action = "oldfiles";
          options = {
            desc = "Recent files";
            silent = true;
          };
        };
        "<leader>fw" = {
          mode = "n";
          action = "grep_string";
          options = {
            desc = "Search word under cursor";
            silent = true;
          };
        };
        "<leader>fb" = {
          mode = "n";
          action = "buffers";
          options = {
            desc = "Find buffer";
            silent = true;
          };
        };
        "<leader>fc" = {
          mode = "n";
          action = "command_history";
          options = {
            desc = "Search in command history";
            silent = true;
          };
        };
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      registrations = {
        "<leader>f" = " Finder";
      };
    };
  };
}
