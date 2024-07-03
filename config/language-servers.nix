{
  config,
  lib,
  pkgs,
  ...
}: {
  keymaps =
    lib.optional config.plugins.telescope.enable
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>Telescope lsp_references<CR>";
      options = {
        desc = "List LSP references";
        silent = true;
      };
    };

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

      formatOnSave = ''
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

      formatAfterSave = ''
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

      formattersByFt = {
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

      logLevel = "error";
      notifyOnError = true;
    };

    # https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
    lint = {
      enable = true;

      autoCmd = {
        event = ["BufEnter" "BufWritePost" "InsertLeave"];
      };
    };

    # https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    lsp = {
      enable = true;
    };

    which-key = lib.mkIf config.plugins.which-key.enable {
      registrations = {
        "<leader>l" = " LSP";
      };
    };
  };
}
