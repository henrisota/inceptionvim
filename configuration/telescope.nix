{
  config,
  lib,
  ...
}: {
  plugins = {
    telescope = {
      enable = true;

      extensions = {
        fzf-native.enable = true;
      };

      keymaps = {
        "<Leader>ff" = {
          mode = "n";
          action = "find_files hidden=true";
          options = {
            desc = "Find files";
            silent = true;
          };
        };
        "<Leader>fg" = {
          mode = "n";
          action = "live_grep";
          options = {
            desc = "Find in files";
            silent = true;
          };
        };
        "<Leader>fz" = {
          mode = "n";
          action = "current_buffer_fuzzy_find";
          options = {
            desc = "Find in current buffer";
            silent = true;
          };
        };
        "<Leader>fr" = {
          mode = "n";
          action = "oldfiles";
          options = {
            desc = "Recent files";
            silent = true;
          };
        };
        "<Leader>fw" = {
          mode = "n";
          action = "grep_string";
          options = {
            desc = "Search word under cursor";
            silent = true;
          };
        };
        "<Leader>fb" = {
          mode = "n";
          action = "buffers";
          options = {
            desc = "Find buffer";
            silent = true;
          };
        };
        "<Leader>fc" = {
          mode = "n";
          action = "command_history";
          options = {
            desc = "Search in command history";
            silent = true;
          };
        };
      };

      settings = {
        defaults = {
          file_ignore_patterns = [
            ".git/"
            ".direnv/"
            ".devenv/"
            ".mypy_cache/"
            ".node_modules/"
            ".terraform/"
            "__pycache__/"
            "flake.lock"
            "package-lock.json"
            "yarn.lock"
          ];
          sorting_strategy = "ascending";
          layout_config = {
            prompt_position = "top";
          };
        };
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<Leader>f";
          group = " Finder";
        }
      ];
    };
  };
}
