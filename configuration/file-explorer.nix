{
  config,
  lib,
  pkgs,
  ...
}: {
  keymaps =
    lib.optional config.plugins.neo-tree.enable
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree action=focus reveal toggle<CR>";
      options = {
        desc = "󰥨 Explorer";
        silent = true;
      };
    };

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
  };
}
