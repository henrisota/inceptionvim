{
  config,
  lib,
  ...
}: let
  header = [
    "███████╗██╗      █████╗ ██╗  ██╗"
    "██╔════╝██║     ██╔══██╗██║ ██╔╝"
    "█████╗  ██║     ███████║█████═╝ "
    "██╔══╝  ██║     ██╔══██║██╔═██╗ "
    "██║     ███████╗██║  ██║██║ ╚██╗"
    "╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝"
  ];
  footer = ["flak plak"];
in {
  plugins = {
    alpha = {
      enable = true;

      layout = let
        padding = val: {
          type = "padding";
          inherit val;
        };
      in [
        (padding 4)
        {
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
          type = "text";
          val = header;
        }
        (padding 2)
        {
          type = "button";
          val = "  New File";
          on_press = {
            __raw = "function() vim.cmd[[ene]] end";
          };
          opts = {
            keymap = [
              "n"
              "n"
              ":ene <BAR> startinsert <CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "n";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 1)
        {
          type = "button";
          val = "󰅚  Quit Neovim";
          on_press = {
            __raw = "function() vim.cmd[[qa]] end";
          };
          opts = {
            keymap = [
              "n"
              "q"
              ":qa<CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "q";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 2)
        {
          opts = {
            hl = "Keyword";
            position = "center";
          };
          type = "text";
          val = footer;
        }
      ];
    };

    dashboard = {
      enable = false;
      settings = {
        change_to_vcs_root = false;

        config = {
          center =
            (
              lib.optionals config.plugins.telescope.enable [
                {
                  icon = "  ";
                  desc = "Find File";
                  action = "Telescope find_files follow=true no_ignore=true hidden=true";
                  shortcut = "SPC f f";
                }
                {
                  icon = "  ";
                  desc = "Find in files";
                  action = "Telescope live_grep";
                  shortcut = "SPC f g";
                }
              ]
            )
            ++ (
              lib.optionals config.plugins.neo-tree.enable [
                {
                  icon = "󰥨  ";
                  desc = "File Explorer";
                  action = "Neotree action=focus reveal toggle";
                  shortcut = "SPC e";
                }
              ]
            )
            ++ [
              {
                icon = "󰅚  ";
                desc = "Quit";
                action = "qa";
              }
            ];

          packages.enable = false;
          project.enable = false;
          week_header.enable = false;

          inherit header footer;
        };

        hide = {
          statusline = true;
          tabline = true;
        };

        shortcut_type = "letter";
        theme = "doom";
      };
    };

    mini = {
      enable = false;
      modules = {
        starter = {
          header = lib.concatLines header;
          inherit footer;
          items =
            (
              lib.optionals config.plugins.telescope.enable [
                {
                  name = "Find file";
                  action = "Telescope find_files follow=true no_ignore=true hidden=true";
                }
                {
                  name = "File in files";
                  action = "Telescope live_grep";
                }
                {
                  name = "Recents";
                  action = "Telescope oldfiles";
                }
              ]
            )
            ++ [
              {
                name = "Quit";
                action = "qa";
              }
            ];
        };
      };
    };
  };
}
