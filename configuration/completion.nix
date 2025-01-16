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
          "<CR>" = "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i', 's'})";
        };

        performance = {
          max_view_entries = 25;
        };

        sources = let
          get_bufnrs = {
            __raw = ''
              function()
                local buf_size_limit = 1024 * 1024
                local bufs = vim.api.nvim_list_bufs()
                local valid_bufs = {}
                for _, buf in ipairs(bufs) do
                  if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
                    table.insert(valid_bufs, buf)
                  end
                end
                return valid_bufs
              end
            '';
          };
        in
          (lib.optionals config.plugins.lsp.enable [
            {
              name = "nvim_lsp";
              priority = 1000;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "nvim_lsp_signature_help";
              priority = 1000;
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "nvim_lsp_document_symbol";
              priority = 1000;
              option = {
                inherit get_bufnrs;
              };
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
              option = {
                inherit get_bufnrs;
              };
            }
            {
              name = "path";
              priority = 300;
            }
          ];

        window = {
          completion = {
            __raw = ''cmp.config.window.bordered()'';
            scrollbar = false;
          };
          documentation.__raw = ''cmp.config.window.bordered()'';
        };
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
          emoji = "[Emoji]";
          git = "[Git]";
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
