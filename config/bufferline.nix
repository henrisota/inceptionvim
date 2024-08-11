{
  config,
  lib,
  pkgs,
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
      mode = "buffers";

      alwaysShowBufferline = true;

      bufferCloseIcon = "";
      modifiedIcon = "●";

      closeCommand = "bdelete! %d";
      closeIcon = "";
      colorIcons = true;
      showBufferIcons = true;
      showBufferCloseIcons = true;
      showCloseIcon = true;

      diagnostics = lib.mkIf config.plugins.lsp.enable "nvim_lsp";
      diagnosticsIndicator = ''
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
          return table.concat(s, " ")
        end
      '';

      indicator = {
        icon = "▎";
        style = "icon";
      };

      leftMouseCommand = "buffer %d";
      middleMouseCommand = "null";
      rightMouseCommand = "bdelete! %d";

      leftTruncMarker = "";
      rightTruncMarker = "";

      maxNameLength = 18;
      maxPrefixLength = 15;

      separatorStyle = "thin";

      sortBy = "extension";

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
