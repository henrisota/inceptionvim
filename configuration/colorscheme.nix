{
  config,
  lib,
  pkgs,
  ...
}: {
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
        term_colors = true;
        show_end_of_buffer = false;
        integrations = {
          alpha = config.plugins.alpha.enable;
          cmp = config.plugins.cmp.enable;
          dap = lib.mkIf config.plugins.dap.enable {
            enabled = true;
            enabled_ui = true;
          };
          dashboard = config.plugins.dashboard.enable;
          gitsigns = config.plugins.gitsigns.enable;
          harpoon = config.plugins.harpoon.enable;
          illuminate.enabled = config.plugins.illuminate.enable;
          indent_blankline.enabled = config.plugins.indent-blankline.enable;
          leap = config.plugins.leap.enable;
          mini.enabled = config.plugins.mini.enable;
          navic = {
            enabled = config.plugins.navic.enable;
            custom_bg = lib.mkIf config.plugins.lualine.enable "lualine";
          };
          neogit = config.plugins.neogit.enable;
          neotest = config.plugins.neotest.enable;
          neotree = config.plugins.neo-tree.enable;
          noice = config.plugins.noice.enable;
          notify = config.plugins.notify.enable;
          telescope.enabled = config.plugins.telescope.enable;
          treesitter = config.plugins.treesitter.enable;
          which_key = config.plugins.which-key.enable;
        };
      };
    };
    base16.colorscheme = "catppuccin-mocha";
  };
}
