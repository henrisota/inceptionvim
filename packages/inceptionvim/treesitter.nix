{
  config,
  lib,
  pkgs,
  ...
}: {
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
          node_decremental = "<bs>";
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
          #  gotoDefinitionLspFallback = null;   # Fallback to `vim.lsp.buf.definition`. Use custom callback func if create mapping of "lua require('nvim-treesitter').refactor.navigation(nil,fallback_function)<cr>";
          #  gotoDefinition = "gnd";             # Go to symbol under cursor
          #  gotoNextUsage = "<a-*>";            # Go to next     usage of identifier
          #  gotoPrevUsage = "<a-#>";            # Go to previous usage of identifier
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
      };

      select = {
        enable = false;
        includeSurroundingWhitespace = false;
        lookahead = false;
      };

      swap = {
        enable = false;
      };
    };
  };
}
