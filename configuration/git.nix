{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    diffview = {
      enable = true;

      gitCmd = ["git"];
      useIcons = true;

      commitLogPanel = {
        winConfig = {
          type = "split";
        };
      };
      fileHistoryPanel = {
        winConfig = {
          type = "split";
        };
      };
      filePanel = {
        listingStyle = "tree";
        treeOptions = {
          flattenDirs = true;
          folderStatuses = "only_folded";
        };
        winConfig = {
          type = "split";
        };
      };

      view = {
        default = {
          layout = "diff2_horizontal";
        };
        fileHistory = {
          layout = "diff2_horizontal";
        };
        mergeTool = {
          disableDiagnostics = true;
          layout = "diff3_mixed";
        };
      };
    };

    gitsigns = {
      enable = true;
      gitPackage = null;

      settings = {
        current_line_blame = true;
        current_line_blame_opts = {
          delay = 500;
          ignore_whitespace = true;
          virt_text = true;
          virt_text_pos = "eol";
          virt_text_priority = 100;
        };

        diff_opts = {
          ignore_blank_lines = true;
          ignore_whitespace = true;
          ignore_whitespace_change = true;
          ignore_whitespace_change_at_eol = true;

          indent_heuristic = false;
          internal = false;

          vertical = true;
        };

        max_file_length = 10000;

        preview_config = {
          border = "single";
          relative = "cursor";
          style = "minimal";
          row = 0;
          col = 1;
        };

        sign_priority = 6;
        signcolumn = true;
        signs = {
          add = {
            text = "┃";
          };
          change = {
            text = "┃";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
          untracked = {
            text = "┆";
          };
        };

        watch_gitdir = {
          enable = true;
          follow_files = true;
        };
      };
    };

    lazygit = let
      configuration = (pkgs.formats.yaml {}).generate "lazygit-config.yml" {
        quitOnTopLevelReturn = true;
      };
    in {
      enable = true;
      settings = {
        use_custom_config_file_path = 1;
        config_file_path = "${configuration}";

        floating_window_border_chars = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
        floating_window_scaling_factor = 0.9;
        floating_window_use_plenary = 0;
        floating_window_winblend = 0;
        use_neovim_remote = 1;
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec =
        [
          {
            __unkeyed-1 = "<Leader>g";
            group = "Git";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.diffview.enable [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gd";
            __unkeyed-2.__raw = ''
              function()
                vim.g.diffview_enabled = not vim.g.diffview_enabled
                if vim.g.diffview_enabled then
                  vim.cmd('DiffviewClose')
                else
                  vim.cmd('DiffviewOpen')
                end
              end
            '';
            desc = "Toggle Git Diff";
            silent = true;
          }
        ])
        ++ (lib.optionals config.plugins.gitsigns.enable [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gp";
            __unkeyed-2.__raw = "function() require('gitsigns').preview_hunk_inline() end";
            desc = "Preview hunk inline";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gP";
            __unkeyed-2.__raw = "function() require('gitsigns').preview_inline() end";
            desc = "Preview hunk";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gs";
            __unkeyed-2.__raw = "function() require('gitsigns').stage_hunk() end";
            desc = "Stage hunk";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gS";
            __unkeyed-2.__raw = "function() require('gitsigns').stage_buffer() end";
            desc = "Stage buffer";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gu";
            __unkeyed-2.__raw = "function() require('gitsigns').undo_stage_hunk() end";
            desc = "Undo stage hunk";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gr";
            __unkeyed-2.__raw = "function() require('gitsigns').reset_hunk() end";
            desc = "Reset hunk";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gR";
            __unkeyed-2.__raw = "function() require('gitsigns').reset_buffer() end";
            desc = "Reset buffer";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gk";
            __unkeyed-2.__raw = "function() require('gitsigns').prev_hunk() end";
            desc = "Jump to previous hunk";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>gj";
            __unkeyed-2.__raw = "function() require('gitsigns').next_hunk() end";
            desc = "Jump to next hunk";
            silent = true;
          }
        ])
        ++ (lib.optional config.plugins.lazygit.enable {
          mode = "n";
          __unkeyed-1 = "<Leader>gg";
          __unkeyed-2 = "<Cmd>LazyGit<CR>";
          desc = "Open LazyGit";
          silent = true;
        });
    };
  };
}
