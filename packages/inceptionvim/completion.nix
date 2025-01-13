{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    cmp = {
      enable = true;

      autoEnableSources = true;

      settings = {
        mapping = {
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        };

        performance = {
          max_view_entries = 25;
        };

        sources =
          (lib.optionals config.plugins.lsp.enable [
            {
              name = "nvim_lsp";
              priority = 1000;
            }
            {
              name = "nvim_lsp_signature_help";
              priority = 1000;
            }
            {
              name = "nvim_lsp_document_symbol";
              priority = 1000;
            }
          ])
          ++ (lib.optional config.plugins.treesitter.enable
            {
              name = "treesitter";
              priority = 850;
            })
          ++ [
            {
              name = "buffer";
              priority = 500;
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
            {
              name = "path";
              priority = 300;
            }
          ];
      };
    };

    lspkind = {
      enable = true;

      mode = "symbol_text";
      preset = "default";

      cmp = lib.mkIf config.plugins.cmp.enable {
        enable = true;

        menu = {
          buffer = "[Buffer]";
          calc = "[Calc]";
          cmdline = "[Cmdline]";
          codeium = "[Codeium]";
          emoji = "[Emoji]";
          git = "[Git]";
          luasnip = "[Snippet]";
          neorg = "[Neorg]";
          nvim_lsp = "[LSP]";
          nvim_lua = "[API]";
          path = "[Path]";
          spell = "[Spell]";
          treesitter = "[TreeSitter]";
        };
      };
    };
  };
}
