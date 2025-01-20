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
        project.enable = false;
        undo.enable = false;
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
      settings.spec =
        [
          {
            __unkeyed-1 = "<Leader>f";
            group = "Finder";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.telescope.enable [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>ff";
            __unkeyed-2 = "<Cmd>Telescope find_files hidden=true<CR>";
            icon = " ";
            desc = "Find files";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>fg";
            __unkeyed-2 = "<Cmd>Telescope live_grep<CR>";
            icon = " ";
            desc = "Find in files";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>fz";
            __unkeyed-2 = "<Cmd>Telescope current_buffer_fuzzy_find<CR>";
            icon = " ";
            desc = "Find in current buffer";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>fr";
            __unkeyed-2 = "<Cmd>Telescope oldfiles<CR>";
            icon = " ";
            desc = "Recent files";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>fw";
            __unkeyed-2 = "<Cmd>Telescope grep_string<CR>";
            icon = " ";
            desc = "Search word under cursor";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>fb";
            __unkeyed-2 = "<Cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>";
            icon = " ";
            desc = "Find buffer";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>fc";
            __unkeyed-2 = "<Cmd>Telescope command_history<CR>";
            icon = " ";
            desc = "Search in command history";
            silent = true;
          }
        ]);
    };
  };
}
