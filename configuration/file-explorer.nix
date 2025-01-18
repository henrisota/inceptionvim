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
