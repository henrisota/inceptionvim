{config, ...}: {
  plugins = {
    treesitter = {
      enable = true;

      folding = false;

      nixvimInjections = true;

      settings = {
        ensure_installed = "all";
        indent = {
          enable = true;
        };
        incremental_selection = {
          enable = true;
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          node_decremental = "<BS>";
        };
      };
    };

    # TODO: Change mappings for navigation
    treesitter-refactor = {
      enable = true;

      highlightCurrentScope.enable = false; # Disabled in favor of indent-blankline
      highlightDefinitions = {
        enable = false; # Disabled in favor of illuminate
        clearOnCursorMove = config.opts.updatetime > 100;
      };
      navigation = {
        enable = true;
        keymaps = {
          #  gotoDefinitionLspFallback = null;   # Fallback to `vim.lsp.buf.definition`. Use custom callback func if create mapping of "lua require('nvim-treesitter').refactor.navigation(nil,fallback_function)<CR>";
          #  gotoDefinition = "gnd";             # Go to symbol under cursor
          #  gotoNextUsage = "<A-*>";            # Go to next     usage of identifier
          #  gotoPrevUsage = "<A-#>";            # Go to previous usage of identifier
          listDefinitions = "gnD"; # List all definitions from current file
          #  listDefinitionsToc = "g0";          # List all definitions from current file like table of contents
        };
      };
      smartRename = {
        enable = true;
        # keymaps.smartRename = "grr";
      };
    };

    # TODO: Change mappings for move, select, and swap
    treesitter-textobjects = {
      enable = true;

      lspInterop = {
        enable = true;
        border = "rounded";
      };

      move = {
        enable = false;
        setJumps = false;

        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };

      select = {
        enable = false;
        includeSurroundingWhitespace = false;
        lookahead = true;

        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };

      swap = {
        enable = false;
      };
    };
  };
}
