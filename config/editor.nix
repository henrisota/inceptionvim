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

  extraPlugins = with pkgs.vimPlugins; [
    smartcolumn-nvim
  ];

  extraConfigLua = ''
    require("smartcolumn").setup({
      colorcolumn = "120",
      disabled_filetypes = ${
      helpers.toLuaObject
      ([
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
        ++ (lib.optionals config.plugins.trouble.enable ["trouble" "Trouble"])
        ++ (lib.optional config.plugins.undotree.enable "undotree"))
    },
      scope = "line",
      custom_colorcolumn = {}
    })
  '';

  keymaps =
    (
      lib.optional config.plugins.navbuddy.enable
      {
        mode = "n";
        key = "<leader>n";
        action = ":Navbuddy<CR>";
        options = {
          desc = "󱣱 Navigate";
          silent = true;
        };
      }
    )
    ++ (lib.optional (config.plugins.telescope.enable && config.plugins.noice.enable) {
      mode = "n";
      key = "<leader>fm";
      action = ":Telescope noice<CR>";
      options = {
        desc = "Find messages";
        silent = true;
      };
    })
    ++ (lib.optionals config.plugins.neogen.enable [
      {
        mode = "n";
        key = "<leader>ca";
        action = ":Neogen<CR>";
        options = {
          desc = "Annotate";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>caf";
        action = ":Neogen func<CR>";
        options = {
          desc = "Annotate function";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cac";
        action = ":Neogen class<CR>";
        options = {
          desc = "Annotate class";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cat";
        action = ":Neogen type<CR>";
        options = {
          desc = "Annotate type";
          silent = true;
        };
      }
    ])
    ++ (lib.optionals config.plugins.noice.enable [
      {
        mode = "n";
        key = "<leader>mh";
        action = ":Noice history<CR>";
        options = {
          desc = "List messages";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ml";
        action = ":Noice last<CR>";
        options = {
          desc = "Get last message";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>me";
        action = ":Noice errors<CR>";
        options = {
          desc = "List errors";
          silent = true;
        };
      }
    ])
    ++ (lib.optionals config.plugins.nvim-ufo.enable [
      {
        mode = "n";
        key = "za";
        action = "za";
        options = {
          desc = "Toggle fold";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "zR";
        action = "<cmd>lua require('ufo').openAllFolds()<CR>";
        options = {
          desc = "Unfold all";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "zM";
        action = "<cmd>lua require('ufo').closeAllFolds()<CR>";
        options = {
          desc = "Fold all";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "zK";
        action = "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>";
        options = {
          desc = "Peek lines in fold";
          silent = true;
        };
      }
    ])
    ++ (lib.optionals config.plugins.spider.enable [
      {
        mode = ["n" "o" "x"];
        key = "w";
        action = "<cmd>lua require('spider').motion('w')<CR>";
        options = {
          desc = "w";
          silent = true;
        };
      }
      {
        mode = ["n" "o" "x"];
        key = "e";
        action = "<cmd>lua require('spider').motion('e')<CR>";
        options = {
          desc = "e";
          silent = true;
        };
      }
      {
        mode = ["n" "o" "x"];
        key = "b";
        action = "<cmd>lua require('spider').motion('b')<CR>";
        options = {
          desc = "b";
          silent = true;
        };
      }
    ])
    ++ (lib.optionals config.plugins.trouble.enable [
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>TroubleToggle<cr>";
        options = {
          desc = "Toggle Trouble";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>xw";
        action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
        options = {
          desc = "Toggle Trouble workspace diagnostics";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>xd";
        action = "<cmd>TroubleToggle document_diagnostics<cr>";
        options = {
          desc = "Toggle Trouble document diagnostics";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>xq";
        action = "<cmd>TroubleToggle quickfix<cr>";
        options = {
          desc = "Toggle Trouble quickfix";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>xl";
        action = "<cmd>TroubleToggle lsp_references<cr>";
        options = {
          desc = "Toggle Trouble location list";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>xt";
        action = "<cmd>TroubleToggle todo<cr>";
        options = {
          desc = "Toggle Trouble todo";
          silent = true;
        };
      }
    ])
    ++ (lib.optional config.plugins.undotree.enable {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr>";
      options = {
        desc = " Undo tree";
        silent = true;
      };
    })
    ++ (lib.optional config.plugins.wtf.enable {
      mode = "n";
      key = "fd";
      action = "<cmd>lua require('wtf').search()<CR>";
      options = {
        desc = "Search diagnostic with Google";
        silent = true;
      };
    });

  plugins = {
    better-escape = {
      enable = true;

      clearEmptyLines = false;
      keys = "<Esc>";
      mapping = ["jj"];
    };

    comment = {
      enable = true;
      settings = {
        padding = true;
        sticky = true;

        toggler = {
          block = "<leader>?";
          line = "<leader>/";
        };

        mappings = {
          basic = true;
          extra = false;
        };
      };
    };

    hardtime = {
      enable = true;
      enabled = true;

      allowDifferentKey = false;
      disableMouse = false;

      disabledFiletypes =
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

      disabledKeys = {
        "<Up>" = ["" "i"];
        "<Down>" = ["" "i"];
        "<Left>" = ["" "i"];
        "<Right>" = ["" "i"];
      };
      hint = true;

      maxCount = 4;
      maxTime = 1000;
      notification = true;

      resettingKeys = {
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

      restrictedKeys = {
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

      restrictionMode = "block";
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
        "<ESC>" = "close";
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
      click = true;
      depthLimit = 0;
      depthLimitIndicator = "..";
      highlight = false;
      lazyUpdateContext = false;

      lsp = {
        autoAttach = true;
      };

      safeOutput = true;
      separator = " > ";
    };

    neogen = {
      enable = true;
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
      enable = true;

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

    nvim-ufo = {
      enable = true;
      providerSelector = ''
        function(bufnr, filetype, buftype)
          return ${
          helpers.toLuaObject
          (
            (lib.optional config.plugins.treesitter.enable "treesitter")
            ++ ["indent"]
          )
        }
          end
      '';
    };

    spider = {
      enable = true;
      skipInsignificantPunctuation = false;
    };

    surround = {
      enable = true;
    };

    todo-comments = {
      enable = true;

      keymaps = {
        todoTelescope = {
          key = "<leader>ft";
        };
      };

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

      mergeKeywords = true;
      signPriority = 8;
      signs = true;
    };

    trouble = {
      enable = true;

      settings = {
        action_keys = {
          cancel = "<esc>";
          close = "q";
          close_folds = ["zM" "zm"];
          hover = "K";
          jump = ["<cr>" "<tab>"];
          jump_close = ["o"];
          next = "j";
          open_folds = ["zR" "zr"];
          open_split = ["<c-x>"];
          open_tab = ["<c-t>"];
          open_vsplit = ["<c-v>"];
          preview = "p";
          previous = "k";
          refresh = "r";
          toggle_fold = ["zA" "za"];
          toggle_mode = "m";
          toggle_preview = "P";
        };

        auto_close = false;
        auto_fold = false;
        auto_jump = ["lsp_definitions"];
        auto_open = false;
        auto_preview = false;
        cycle_results = false;

        fold_closed = "";
        fold_open = "";

        group = true;
        icons = true;
        include_declaration = ["lsp_references" "lsp_implementations" "lsp_definitions"];
        indent_lines = true;
        mode = "workspace_diagnostics";
        padding = true;
        position = "bottom";

        signs = {
          error = "";
          hint = "";
          information = "";
          other = "﫠";
          warning = "";
        };

        use_diagnostic_signs = false;
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

    which-key = lib.mkIf config.plugins.which-key.enable {
      registrations = {
        "<leader>c" = " Create";
        "<leader>m" = "󰍥 Messages";
        "<leader>x" = " Trouble";
        "z" = " Folds";
      };
    };

    wtf = {
      enable = true;
      searchEngine = "google";
    };
  };
}
