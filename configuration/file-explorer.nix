{
  config,
  lib,
  ...
}: {
  plugins = {
    neo-tree = {
      enable = true;

      enableGitStatus = true;
      enableModifiedMarkers = true;

      addBlankLineAtTop = false;
      closeIfLastWindow = true;
      hideRootNode = false;

      sortCaseInsensitive = false;

      buffers = {
        followCurrentFile = {
          enabled = true;
          leaveDirsOpen = false;
        };
      };

      filesystem = {
        bindToCwd = true;

        filteredItems = {
          hideDotfiles = false;
          hideHidden = true;
          hideGitignored = false;

          neverShow = [
            ".direnv"
            ".devenv"
            ".git"
          ];

          visible = true;
        };

        findCommand = "fd";

        followCurrentFile = {
          enabled = true;
          leaveDirsOpen = false;
        };
      };

      window = {
        autoExpandWidth = false;
        insertAs = "child";
        position = "left";
        sameLevel = false;

        mappings = let
          noneMappings = [
            "<BS>"
            "/"
            "#"
            "<C-x>"
            "<"
            ">"
            "[g"
            "]g"
            "s"
            "D"
            "f"
          ];

          noneAttributes = builtins.listToAttrs (map (key: {
              name = key;
              value = "none";
            })
            noneMappings);
        in
          {
            "<space>" = {
              command = "toggle_node";
              nowait = false;
            };
            "." = "set_root";

            "<CR>" = "open";
            "<2-LeftMouse>" = "open";

            h = "open_split";
            v = "open_vsplit";

            P = {
              command = "toggle_preview";
              config.use_float = true;
            };
            l = "focus_preview";
            "<C-f>" = {
              command = "scroll_preview";
              config.direction = -10;
            };
            "<C-b>" = {
              command = "scroll_preview";
              config.direction = 10;
            };

            t = "open_tabnew";

            C = "close_node";
            z = "close_all_nodes";
            Z = "expand_all_nodes";

            R = "refresh";

            a = {
              command = "add";
              config.show_path = "none";
            };
            A = "add_directory";
            d = "delete";
            r = "rename";

            y = "copy_to_clipboard";
            x = "cut_to_clipboard";
            p = "paste_from_clipboard";

            c = "copy";
            m = "move";

            e = "toggle_auto_expand_width";

            q = "close_window";

            "?" = "show_help";
          }
          // noneAttributes;
      };
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec = [
        {
          mode = "n";
          __unkeyed-1 = "<Leader>e";
          __unkeyed-2 = "<Cmd>Neotree action=focus reveal toggle<CR>";
          icon = "󰥨 ";
          desc = "Explorer";
          silent = true;
        }
      ];
    };
  };
}
