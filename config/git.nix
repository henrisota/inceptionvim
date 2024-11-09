{
  config,
  lib,
  pkgs,
  ...
}: {
  keymaps =
    (lib.optionals config.plugins.diffview.enable [
      {
        mode = "n";
        key = "<leader>gd";
        action.__raw = ''
          function()
            vim.g.diffview_enabled = not vim.g.diffview_enabled
            if vim.g.diffview_enabled then
              vim.cmd('DiffviewClose')
            else
              vim.cmd('DiffviewOpen')
            end
          end
        '';
        options = {
          desc = "Toggle Git Diff";
          silent = true;
        };
      }
    ])
    ++ (lib.optionals config.plugins.gitsigns.enable [
      {
        mode = "n";
        key = "<leader>gp";
        action = "function() require('gitsigns').preview_hunk_inline() end";
        options = {
          desc = "Preview hunk inline";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gP";
        action = "function() require('gitsigns').preview_inline() end";
        options = {
          desc = "Preview hunk";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "function() require('gitsigns').stage_hunk() end";
        options = {
          desc = "Stage hunk";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gS";
        action = "function() require('gitsigns').stage_buffer() end";
        options = {
          desc = "Stage buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gu";
        action = "function() require('gitsigns').undo_stage_hunk() end";
        options = {
          desc = "Undo stage hunk";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = "function() require('gitsigns').reset_hunk() end";
        options = {
          desc = "Reset hunk";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gR";
        action = "function() require('gitsigns').reset_buffer() end";
        options = {
          desc = "Reset buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gk";
        action = "function() require('gitsigns').prev_hunk() end";
        options = {
          desc = "Jump to previous hunk";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gj";
        action = "function() require('gitsigns').next_hunk() end";
        options = {
          desc = "Jump to next hunk";
          silent = true;
        };
      }
    ])
    ++ (lib.optional config.plugins.lazygit.enable {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "Open LazyGit";
        silent = true;
      };
    });

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

        show_deleted = false;

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

    lazygit = {
      enable = true;
      settings = {
        floating_window_border_chars = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
        floating_window_scaling_factor = 0.9;
        floating_window_use_plenary = 0;
        floating_window_winblend = 0;
        use_neovim_remote = 1;
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<leader>g";
          group = " Git";
        }
      ];
    };
  };
}
