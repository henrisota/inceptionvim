{
  config,
  lib,
  ...
}: {
  keymaps =
    lib.optionals config.plugins.bufferline.enable
    [
      {
        mode = "n";
        key = "<leader>bp";
        action = ":BufferLinePick<CR>";
        options = {
          desc = "Pick buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bc";
        action = ":BufferLineCloseOthers<CR>";
        options = {
          desc = "Close all buffers except current";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-Tab>";
        action = ":BufferLineCycleNext<CR>";
        options = {
          desc = "Move to next buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-S-Tab>";
        action = ":BufferLineCyclePrev<CR>";
        options = {
          desc = "Move to previous buffer";
          silent = true;
        };
      }
    ];

  plugins = {
    bufferline = {
      enable = true;

      settings = {
        options = {
          mode = "buffers";

          always_show_bufferline = true;
          enforce_regular_tabs = false;

          buffer_close_icon = "";
          modified_icon = "●";

          close_command = "bdelete! %d";
          close_icon = "";
          color_icons = true;
          show_buffer_icons = true;
          show_buffer_close_icons = false;
          show_close_icon = false;
          show_tab_indicators = false;

          diagnostics = lib.mkIf config.plugins.lsp.enable "nvim_lsp";
          diagnostics_indicator = ''
            function(count, level, diagnostics, context)
              local s = {}
              local severities = {
                "error",
                "warning"
              }
              signs = {
                error = "",
                warning = "",
                hint = "",
                info = ""
              }
              for _, severity in ipairs(severities) do
                if diagnostics[severity] then
                  table.insert(s, signs[severity] .. " " .. diagnostics[severity])
                end
              end
              return (table.concat(s, " ")):match("^%s*(.-)%s*$")
            end
          '';

          indicator = {
            icon = "▎";
            style = "icon";
          };

          left_mouse_command = "buffer %d";
          middle_mouse_command = "bdelete! %d";
          right_mouse_command = "bdelete! %d";

          left_trunc_marker = "";
          right_trunc_marker = "";

          max_name_length = 18;
          max_prefix_length = 15;

          numbers = "none";

          separator_style = "thin";

          sort_by = "extension";

          offsets =
            (lib.optional config.plugins.neo-tree.enable
              {
                filetype = "neo-tree";
                highlight = "Directory";
                separator = true;
                text = "File Explorer";
                text_align = "left";
              })
            ++ (lib.optional config.plugins.diffview.enable
              {
                filetype = "DiffviewFiles";
                separator = true;
                text = "Git Diff";
                text_align = "left";
              });
        };
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = " Buffers";
        }
      ];
    };
  };
}
