{
  config,
  lib,
  ...
}: {
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

          truncate_names = true;

          offsets = map (offset:
            offset
            // {
              highlight = "PanelHeading";
              separator = true;
              text_align = "left";
            }) (
            (lib.optional config.plugins.diffview.enable
              {
                filetype = "DiffviewFiles";
                text = "Git Diff";
              })
            ++ (lib.optional config.plugins.neo-tree.enable
              {
                filetype = "neo-tree";
                text = "Explorer";
              })
            ++ (lib.optional config.plugins.nvim-tree.enable
              {
                filetype = "NvimTree";
                text = "Explorer";
              })
            ++ (lib.optional config.plugins.undotree.enable {
              filetype = "undotree";
              text = "Undotree";
            })
          );
        };
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec =
        [
          {
            __unkeyed-1 = "<Leader>b";
            group = "Buffers";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.bufferline.enable
          [
            {
              mode = "n";
              __unkeyed-1 = "<Leader>bp";
              __unkeyed-2 = "<Cmd>BufferLinePick<CR>";
              desc = "Pick buffer";
              silent = true;
            }
            {
              mode = "n";
              __unkeyed-1 = "<Leader>bc";
              __unkeyed-2 = "<Cmd>BufferLineCloseOthers<CR>";
              desc = "Close all buffers except current";
              silent = true;
            }
            {
              mode = "n";
              __unkeyed-1 = "<M-Tab>";
              __unkeyed-2 = "<Cmd>BufferLineCycleNext<CR>";
              desc = "Move to next buffer";
              silent = true;
            }
            {
              mode = "n";
              __unkeyed-1 = "<M-S-Tab>";
              __unkeyed-2 = "<Cmd>BufferLineCyclePrev<CR>";
              desc = "Move to previous buffer";
              silent = true;
            }
          ]);
    };
  };
}
