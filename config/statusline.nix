{
  config,
  lib,
  pkgs,
  ...
}: let
  lsp-progress = pkgs.vimUtils.buildVimPlugin {
    name = "lsp-progress";
    version = "unstable-2024-07-15";
    # https://github.com/linrongbin16/lsp-progress.nvim/tree/d5f4d28efe75ce636bfbe271eb45f39689765aab
    src = pkgs.fetchFromGitHub {
      owner = "linrongbin16";
      repo = "lsp-progress.nvim";
      rev = "d5f4d28efe75ce636bfbe271eb45f39689765aab";
      hash = "sha256-OafRT5AnxRTOh7MYofRFjti0+pobKQihymZs/kr5w0A=";
    };
  };
in {
  autoCmd = [
    {
      event = "User";
      group = "statusline";
      command = "silent! lua require('lualine').refresh";
      pattern = ["LspProgressStatusUpdated"];
    }
  ];

  autoGroups = {
    statusline = {
      clear = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    lsp-progress
  ];

  extraConfigLua = ''
    require("lsp-progress").setup({
      client_format = function(client_name, spinner, series_messages)
          if #series_messages == 0 then
              return nil
          end
          return {
              name = client_name,
              body = spinner .. " " .. table.concat(series_messages, ", "),
          }
      end,
      format = function(client_messages)
          --- @param name string
          --- @param msg string?
          --- @return string
          local function stringify(name, msg)
              return msg and string.format("%s %s", name, msg) or name
          end

          local sign = ""
          local lsp_clients = vim.lsp.get_active_clients()
          local messages_map = {}
          for _, climsg in ipairs(client_messages) do
              messages_map[climsg.name] = climsg.body
          end

          if #lsp_clients > 0 then
              table.sort(lsp_clients, function(a, b)
                  return a.name < b.name
              end)
              local builder = {}
              for _, cli in ipairs(lsp_clients) do
                  if
                      type(cli) == "table"
                      and type(cli.name) == "string"
                      and string.len(cli.name) > 0
                  then
                      if messages_map[cli.name] then
                          table.insert(
                              builder,
                              stringify(cli.name, messages_map[cli.name])
                          )
                      else
                          table.insert(builder, stringify(cli.name))
                      end
                  end
              end
              if #builder > 0 then
                  return sign .. " " .. table.concat(builder, ", ")
              end
          end
          return ""
      end,
    })
  '';

  plugins = {
    lualine = {
      enable = true;

      settings = {
        always_divide_middle = true;
        disabled_filetypes = {
          statusline =
            [
              "checkhealth"
              "help"
              "netrw"
            ]
            ++ (lib.optional config.plugins.alpha.enable "alpha")
            ++ (lib.optional config.plugins.dashboard.enable "dashboard")
            ++ (lib.optional config.plugins.diffview.enable "Diffview*")
            ++ (lib.optional config.plugins.lsp.enable "lspinfo*")
            ++ (lib.optional config.plugins.neo-tree.enable "neo-tree")
            ++ (lib.optional config.plugins.noice.enable "noice")
            ++ (lib.optional config.plugins.notify.enable "notify")
            ++ (lib.optionals config.plugins.telescope.enable ["TelescopePrompt" "TelescopeResults"])
            ++ (lib.optional config.plugins.toggleterm.enable "toggleterm")
            ++ (lib.optional config.plugins.undotree.enable "undotree");

          winbar =
            [
              "checkhealth"
              "help"
              "netrw"
            ]
            ++ (lib.optional config.plugins.alpha.enable "alpha")
            ++ (lib.optional config.plugins.dashboard.enable "dashboard")
            ++ (lib.optional config.plugins.diffview.enable "Diffview*")
            ++ (lib.optional config.plugins.lsp.enable "lspinfo*")
            ++ (lib.optional config.plugins.neo-tree.enable "neo-tree")
            ++ (lib.optional config.plugins.noice.enable "noice")
            ++ (lib.optional config.plugins.notify.enable "notify")
            ++ (lib.optionals config.plugins.telescope.enable ["TelescopePrompt" "TelescopeResults"])
            ++ (lib.optional config.plugins.toggleterm.enable "toggleterm")
            ++ (lib.optional config.plugins.undotree.enable "undotree");
        };

        globalstatus = true;
        icons_enabled = true;
        refresh = {
          statusline = 1000;
          tabline = 1000;
          winbar = 1000;
        };

        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "▌";
          right = "▐";
        };

        extensions =
          # https://github.com/nvim-lualine/lualine.nvim/tree/master/lua/lualine/extensions
          ["fzf"]
          ++ (lib.optional config.plugins.dap.enable "nvim-dap-ui")
          ++ (lib.optional config.plugins.neo-tree.enable "neo-tree")
          ++ (lib.optional config.plugins.toggleterm.enable "toggleterm")
          ++ (lib.optional config.plugins.trouble.enable "trouble");

        sections = {
          lualine_a = [
            "mode"
          ];

          lualine_b = [
            "branch"
            "diff"
          ];

          lualine_c =
            [
              "diagnostics"
              "filename"
              {
                fmt = ''
                  function()
                   return require("lsp-progress").progress()
                  end
                '';
              }
            ]
            ++ (
              lib.optional config.plugins.lint.enable
              {
                fmt = ''
                  function()
                    local linters = require("lint").get_running()
                    if #linters == 0 then
                      return "󰦕"
                    end
                    return "󱉶 " .. table.concat(linters, ", ")
                  end
                '';
              }
            );

          lualine_x =
            (lib.optional config.plugins.noice.enable {
              fmt = ''
                function()
                  if package.loaded["noice"] and require("noice").api.status.mode.has() then
                    return require("noice").api.status.mode.get()
                  end
                  return ""
                end
              '';
            })
            ++ (lib.optional config.plugins.better-escape.enable {
              fmt = ''
                function()
                  local ok, m = pcall(require, 'better_escape')
                  return ok and m.waiting and '✺' or ""
                end
              '';
            })
            ++ [
              {
                padding = {
                  left = 0;
                  right = 0;
                };
                separator = {
                  left = "";
                  right = "";
                };
              }
              "fileformat"
              "encoding"
            ];

          lualine_y = [
            {
              fmt = ''
                function()
                 return ""
                end,
              '';
            }
          ];

          lualine_z = [
            {
              fmt = ''
                function()
                  return "Ln %l, Col %c"
                end
              '';
            }
          ];
        };

        inactive_sections = {
          lualine_a = [];

          lualine_b = [];

          lualine_c = [
            "filename"
          ];

          lualine_x = [
            "location"
          ];

          lualine_y = [];

          lualine_z = [];
        };

        tabline = {};

        winbar = {
          lualine_c =
            [
              {
                fmt = ''
                  function()
                   return " "
                  end,
                '';
              }
            ]
            ++ (lib.optional config.plugins.navic.enable "navic");
        };

        inactive_winbar = {
          lualine_c =
            [
              {
                fmt = ''
                  function()
                   return " "
                  end,
                '';
              }
            ]
            ++ (lib.optional config.plugins.navic.enable "navic");
        };
      };
    };
  };
}
