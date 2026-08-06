{
  config,
  lib,
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
          node_decremental = "<BS>";
        };
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

  keymaps = lib.mkIf config.plugins.lsp.enable [
    {
      mode = "n";
      key = "gnD";
      action =
        if config.plugins.telescope.enable
        then "<Cmd>Telescope lsp_document_symbols<CR>"
        else "<Cmd>lua vim.lsp.buf.document_symbol()<CR>";
      options = {
        silent = true;
        desc = "List definitions in current file";
      };
    }
  ];
}
