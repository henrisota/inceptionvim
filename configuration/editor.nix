{
  config,
  helpers,
  lib,
  pkgs,
  ...
}: {
  clipboard = {
    providers.wl-copy.enable = lib.mkIf pkgs.stdenv.isDarwin true;
    register = "unnamedplus";
  };

  plugins = {
    better-escape = {
      enable = true;
      settings = {
        mapping = {
          j.j = "<Esc>";
        };
      };
    };

    comment = {
      enable = true;
      settings = {
        padding = true;
        sticky = true;

        toggler = {
          block = "<Leader>?";
          line = "<Leader>/";
        };

        mappings = {
          basic = true;
          extra = false;
        };
      };
    };

    hardtime = {
      enable = false;

      settings = {
        enabled = false;

        allow_different_key = false;
        disable_mouse = false;

        disabled_filetypes =
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
          ++ (lib.optional config.plugins.neotest.enable "neotest")
          ++ (lib.optional config.plugins.noice.enable "noice")
          ++ (lib.optional config.plugins.notify.enable "notify")
          ++ (lib.optionals config.plugins.telescope.enable ["TelescopePrompt" "TelescopeResults"])
          ++ (lib.optional config.plugins.toggleterm.enable "toggleterm")
          ++ (lib.optionals config.plugins.trouble.enable ["trouble" "Trouble"])
          ++ (lib.optional config.plugins.undotree.enable "undotree");

        disabled_keys = {
          "<Up>" = ["" "i"];
          "<Down>" = ["" "i"];
          "<Left>" = ["" "i"];
          "<Right>" = ["" "i"];
        };
        hint = true;

        max_count = 4;
        max_time = 1000;
        notification = true;

        resetting_keys = {
          "1" = ["n" "x"];
          "2" = ["n" "x"];
          "3" = ["n" "x"];
          "4" = ["n" "x"];
          "5" = ["n" "x"];
          "6" = ["n" "x"];
          "7" = ["n" "x"];
          "8" = ["n" "x"];
          "9" = ["n" "x"];
          "c" = ["n"];
          "C" = ["n"];
          "d" = ["n"];
          "x" = ["n"];
          "X" = ["n"];
          "y" = ["n"];
          "Y" = ["n"];
          "p" = ["n"];
          "P" = ["n"];
          "." = ["n"];
          "=" = ["n"];
          "<" = ["n"];
          ">" = ["n"];
          "~" = ["n"];
        };

        restricted_keys = {
          # "h" = ["n" "x"];
          # "j" = ["n" "x"];
          # "k" = ["n" "x"];
          # "l" = ["n" "x"];
          "-" = ["n" "x"];
          "+" = ["n" "x"];
          "gj" = ["n" "x"];
          "gk" = ["n" "x"];
          "<CR>" = ["n" "x"];
          "<C-M>" = ["n" "x"];
          "<C-N>" = ["n" "x"];
          "<C-P>" = ["n" "x"];
        };

        restriction_mode = "block";
      };
    };

    illuminate = {
      enable = true;

      delay = 100;
      filetypesDenylist =
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
      minCountToHighlight = 1;
      providers = (lib.optional config.plugins.lsp.enable "lsp") ++ (lib.optional config.plugins.treesitter.enable "treesitter");
      underCursor = true;
    };

    navbuddy = {
      enable = true;

      keymapsSilent = true;

      lsp = {
        autoAttach = true;
      };

      mappings = {
        "<Esc>" = "close";
        "q" = "close";

        "j" = "next_sibling";
        "k" = "previous_sibling";

        "h" = "parent";
        "l" = "children";
        "0" = "root";

        "v" = "visual_name";
        "V" = "visual_scope";

        "y" = "yank_name";
        "Y" = "yank_scope";

        "i" = "insert_name";
        "I" = "insert_scope";

        "a" = "append_name";
        "A" = "append_scope";

        "r" = "rename";

        "d" = "delete";

        "f" = "fold_create";
        "F" = "fold_delete";

        "c" = lib.mkIf config.plugins.comment.enable "comment";

        "<enter>" = "select";
        "o" = "select";

        "J" = "move_down";
        "K" = "move_up";

        # "s" = "toggle_preview";

        # "<C-v>" = "vsplit";
        # "<C-s>" = "hsplit";
      };
      useDefaultMapping = false;

      nodeMarkers.enabled = true;

      sourceBuffer = {
        followNode = true;
        highlight = true;
        reorient = "smart";
      };

      window = {
        border = "rounded";
        sections = {
          right.preview = "leaf";
        };
      };
    };

    navic = {
      enable = true;

      settings = {
        click = true;
        depth_limit = 0;
        depth_limit_indicator = "..";
        highlight = false;
        lazy_update_context = false;

        lsp = {
          auto_attach = true;
        };

        safe_output = true;
        separator = " > ";
      };
    };

    neogen = {
      enable = false;
      enablePlaceholders = true;
      inputAfterComment = true;
      keymapsSilent = true;
    };

    neoscroll = {
      enable = true;

      settings = {
        cursor_scrolls_alone = true;
        easing_function = "linear";
        hide_cursor = true;
        mappings = [
          "<C-u>"
          "<C-d>"
          "<C-b>"
          "<C-f>"
          "<C-y>"
          "<C-e>"
        ];
        performance_mode = false;
        respect_scrolloff = false;
        step_eof = true;
      };
    };

    notify = {
      enable = true;
    };

    noice = {
      enable = false;

      settings = {
        cmdline = {
          enabled = true;
          view = "cmdline_popup";
          format = {
            cmdline = {
              pattern = "^:";
              icon = "";
              lang = "vim";
              opts = {
                border = {
                  text = {
                    top = "Command";
                  };
                };
              };
            };
            search_down = {
              kind = "search";
              pattern = "^/";
              icon = " ";
              lang = "regex";
            };
            search_up = {
              kind = "search";
              pattern = "^%?";
              icon = " ";
              lang = "regex";
            };
            shell = {
              pattern = "^:!";
              icon = " ";
              lang = "bash";
            };
            filter = {
              pattern = "^:%s!%s+";
              icon = "";
              lang = "bash";
            };
            lua = {
              pattern = "^:%s*lua%s+";
              icon = "";
              lang = "lua";
            };
            help = {
              pattern = "^:%s*he?l?p?%s+";
              icon = "";
            };
            open = {
              pattern = "^:%s*e%s+";
              icon = "";
            };
            input = {};
          };
        };

        commands = {
          history = {
            view = "split";
            opts = {
              enter = true;
              format = "details";
            };
            filter = {
              any = [
                {
                  event = "notify";
                }
                {
                  error = true;
                }
                {
                  warning = true;
                }
                {
                  event = "msg_show";
                  kind = [""];
                }
                {
                  event = "lsp";
                  kind = "message";
                }
              ];
            };
          };
          last = {
            view = "popup";
            opts = {
              enter = true;
              format = "details";
            };
            filter = {
              any = [
                {
                  event = "notify";
                }
                {
                  error = true;
                }
                {
                  warning = true;
                }
                {
                  event = "msg_show";
                  kind = [""];
                }
                {
                  event = "lsp";
                  kind = "message";
                }
              ];
            };
            filter_opts = {count = 1;};
          };
          errors = {
            view = "popup";
            opts = {
              enter = true;
              format = "details";
            };
            filter = {error = true;};
            filter_opts = {reverse = true;};
          };
        };

        health.checker = true;

        lsp = {
          documentation = {
            view = "hover";
          };
          hover.enabled = false;
          message = {
            enabled = true;
            view = "notify";
          };
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = config.plugins.cmp.enable;
          };
          progress = {
            enabled = false;
          };
          signature = {
            enabled = false;
            autoOpen = {
              enabled = true;
              trigger = true;
              luasnip = true;
            };
          };
        };

        messages = {
          enabled = true;
          view = "notify";
          viewError = "notify";
          viewHistory = "messages";
          viewSearch = "virtualtext";
          viewWarn = "notify";
        };

        notify = {
          enabled = true;
          view = "notify";
        };

        popupmenu = {
          enabled = true;
          backend = "nui";
        };

        presets = {
          bottom_search = false;
          command_palette = false;
          long_message_to_split = false;
          inc_rename = false;
          lsp_doc_border = false;
        };

        routes = [
          {
            filter = {
              find = "No information available";
            };
            opts = {
              stop = true;
            };
          }
          {
            filter = {
              event = "msg_show";
              any = [
                {
                  find = "%d+L, %d+B";
                }
                {
                  find = "; after #%d+";
                }
                {
                  find = "; before #%d+";
                }
                {
                  find = "%d fewer lines";
                }
                {
                  find = "%d more lines";
                }
              ];
            };
            opts = {
              skip = true;
            };
          }
        ];

        smartMove = {
          enabled = true;
          excludedFiletypes = [
            "cmp_menu"
            "cmp_docs"
            "notify"
          ];
        };

        status = {};

        views = {};
      };
    };

    nvim-ufo = {
      enable = true;

      settings = {
        provider_selector = ''
          function(bufnr, filetype, buftype)
            return ${
            helpers.toLuaObject
            (
              (
                if config.plugins.treesitter.enable
                then ["treesitter"]
                else if config.plugins.lsp.enable
                then ["lsp"]
                else []
              )
              ++ ["indent"]
            )
          }
            end
        '';
      };
    };

    smartcolumn = {
      enable = true;

      settings = {
        colorcolumn = "120";
        custom_colorcolumn = {};
        disabled_filetypes =
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
          ++ (lib.optional config.plugins.neotest.enable "neotest")
          ++ (lib.optional config.plugins.noice.enable "noice")
          ++ (lib.optional config.plugins.notify.enable "notify")
          ++ (lib.optionals config.plugins.telescope.enable ["TelescopePrompt" "TelescopeResults"])
          ++ (lib.optional config.plugins.toggleterm.enable "toggleterm")
          ++ (lib.optionals config.plugins.trouble.enable ["trouble" "Trouble"])
          ++ (lib.optional config.plugins.undotree.enable "undotree");
        scope = "file";
      };
    };

    spider = {
      enable = true;
      skipInsignificantPunctuation = false;
    };

    vim-surround = {
      enable = false;
    };

    todo-comments = {
      enable = false;

      keymaps = {
        todoTelescope = {
          key = "<Leader>ft";
        };
      };

      settings = {
        keywords = {
          TODO = {
            icon = " ";
            color = "info";
          };
          FIX = {
            icon = " ";
            color = "error";
            alt = ["BUG" "FIXME" "ISSUE"];
          };
          WARN = {
            icon = " ";
            color = "warning";
            alt = ["WARNING"];
          };
          NOTE = {
            icon = " ";
            color = "hint";
            alt = ["INFO"];
          };
          TEST = {
            icon = "⏲ ";
            color = "test";
          };
          PERF = {
            icon = " ";
            color = "info";
            alt = ["OPTIMIZE" "PERFORMANCE"];
          };
        };

        merge_keywords = true;
        sign_priority = 8;
        signs = true;
      };
    };

    trouble = {
      enable = false;

      settings = {
        auto_close = false;
        auto_fold = false;
        auto_open = false;
        auto_preview = false;

        fold_closed = "";
      };
    };

    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = false;
        focusOnToggle = true;

        shortIndicators = false;

        TreeNodeShape = "*";
        TreeSplitShape = "/";
        TreeReturnShape = "\\";
        TreeVertShape = "|";

        windowLayout = 1;
      };
    };

    wtf = {
      enable = false;
      searchEngine = "google";
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec =
        [
          {
            __unkeyed-1 = "<Leader>c";
            group = "Create";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.neogen.enable [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>ca";
            __unkeyed-2 = "<Cmd>Neogen<CR>";
            desc = "Annotate";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>caf";
            __unkeyed-2 = "<Cmd>Neogen func<CR>";
            desc = "Annotate function";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>cac";
            __unkeyed-2 = "<Cmd>Neogen class<CR>";
            desc = "Annotate class";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>cat";
            __unkeyed-2 = "<Cmd>Neogen type<CR>";
            desc = "Annotate type";
            silent = true;
          }
        ])
        ++ (lib.optional (config.plugins.telescope.enable && config.plugins.noice.enable) {
          mode = "n";
          __unkeyed-1 = "<Leader>fm";
          __unkeyed-2 = "<Cmd>Telescope noice<CR>";
          desc = "Find messages";
          silent = true;
        })
        ++ (lib.optionals config.plugins.spider.enable [
          {
            mode = ["n" "o" "x"];
            __unkeyed-1 = "w";
            __unkeyed-2 = "<Cmd>lua require('spider').motion('w')<CR>";
            desc = "w";
            silent = true;
          }
          {
            mode = ["n" "o" "x"];
            __unkeyed-1 = "e";
            __unkeyed-2 = "<Cmd>lua require('spider').motion('e')<CR>";
            desc = "e";
            silent = true;
          }
          {
            mode = ["n" "o" "x"];
            __unkeyed-1 = "b";
            __unkeyed-2 = "<Cmd>lua require('spider').motion('b')<CR>";
            desc = "b";
            silent = true;
          }
        ])
        ++ (lib.optional config.plugins.undotree.enable {
          mode = "n";
          __unkeyed-1 = "<Leader>u";
          __unkeyed-2 = "<Cmd>UndotreeToggle<CR>";
          icon = " ";
          desc = "Undo tree";
          silent = true;
        })
        ++ (lib.optional config.plugins.wtf.enable {
          mode = "n";
          __unkeyed-1 = "fd";
          __unkeyed-2 = "<Cmd>lua require('wtf').search()<CR>";
          desc = "Search diagnostic with Google";
          silent = true;
        })
        ++ [
          {
            __unkeyed-1 = "<Leader>m";
            group = "Messages";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.noice.enable [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>mh";
            __unkeyed-2 = "<Cmd>Noice history<CR>";
            desc = "List messages";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>ml";
            __unkeyed-2 = "<Cmd>Noice last<CR>";
            desc = "Get last message";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>me";
            __unkeyed-2 = "<Cmd>Noice errors<CR>";
            desc = "List errors";
            silent = true;
          }
        ])
        ++ (
          lib.optional config.plugins.navbuddy.enable
          {
            mode = "n";
            __unkeyed-1 = "<Leader>n";
            __unkeyed-2 = "<Cmd>Navbuddy<CR>";
            icon = "󱣱 ";
            desc = "Navigate";
            silent = true;
          }
        )
        ++ [
          {
            __unkeyed-1 = "<Leader>x";
            group = "Trouble";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.trouble.enable [
          {
            mode = "n";
            __unkeyed-1 = "<Leader>xx";
            __unkeyed-2 = "<Cmd>TroubleToggle<CR>";
            desc = "Toggle Trouble";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>xw";
            __unkeyed-2 = "<Cmd>TroubleToggle workspace_diagnostics<CR>";
            desc = "Toggle Trouble workspace diagnostics";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>xd";
            __unkeyed-2 = "<Cmd>TroubleToggle document_diagnostics<CR>";
            desc = "Toggle Trouble document diagnostics";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>xq";
            __unkeyed-2 = "<Cmd>TroubleToggle quickfix<CR>";
            desc = "Toggle Trouble quickfix";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>xl";
            __unkeyed-2 = "<Cmd>TroubleToggle lsp_references<CR>";
            desc = "Toggle Trouble location list";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "<Leader>xt";
            __unkeyed-2 = "<Cmd>TroubleToggle todo<CR>";
            desc = "Toggle Trouble todo";
            silent = true;
          }
        ])
        ++ [
          {
            __unkeyed-1 = "z";
            group = "Folds";
            icon = " ";
          }
        ]
        ++ (lib.optionals config.plugins.nvim-ufo.enable [
          {
            mode = "n";
            __unkeyed-1 = "za";
            __unkeyed-2 = "za";
            desc = "Toggle fold";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "zR";
            __unkeyed-2 = "<Cmd>lua require('ufo').openAllFolds()<CR>";
            desc = "Unfold all";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "zM";
            __unkeyed-2 = "<Cmd>lua require('ufo').closeAllFolds()<CR>";
            desc = "Fold all";
            silent = true;
          }
          {
            mode = "n";
            __unkeyed-1 = "zK";
            __unkeyed-2 = "<Cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>";
            desc = "Peek lines in fold";
            silent = true;
          }
        ]);
    };
  };
}
