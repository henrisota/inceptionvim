{
  config,
  lib,
  pkgs,
  ...
}: {
  # https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#automatically-run-slow-formatters-async
  extraConfigLuaPre = ''
    local slow_format_filetypes = {}

    vim.api.nvim_create_user_command("FormatDisable", function(args)
       if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        -- Toggle formatting for current buffer
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      else
        -- Toggle formatting globally
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';

  plugins = {
    # https://github.com/stevearc/conform.nvim/blob/master/doc/conform.txt
    conform-nvim = {
      enable = true;

      settings = {
        format_on_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
          end
        '';
        format_after_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            return { lsp_fallback = true }
          end
        '';

        formatters_by_ft = {
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };

        formatters = {
          squeeze_blanks = {
            command = lib.getExe' pkgs.coreutils "cat";
          };
        };

        log_level = "error";
        notify_on_error = true;
        notify_no_formatters = false;
      };
    };

    # https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
    lint = {
      enable = true;

      autoCmd = {
        event = ["BufWritePost"];
      };
    };

    # https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    lsp = {
      enable = true;
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      settings.spec =
        [
          {
            __unkeyed-1 = "<Leader>l";
            group = "LSP";
            icon = " ";
          }
        ]
        ++ (
          lib.optional (config.plugins.telescope.enable && config.plugins.lsp.enable)
          {
            mode = "n";
            __unkeyed-1 = "<Leader>lr";
            __unkeyed-2 = "<Cmd>Telescope lsp_references<CR>";
            desc = "List LSP references";
            silent = true;
          }
        );
    };
  };
}
