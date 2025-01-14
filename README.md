<h1 align="center">
   <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/refs/heads/master/logo/nix-snowflake-colours.svg" width="100px" />
   <br>
   inceptionvim
   <div align="center">
      <p></p>
      <div align="center">
         <a>
            <img src="https://img.shields.io/badge/Nix-Unstable-blue?style=for-the-badge&logo=nixos&label=NIX&labelColor=303446&color=94e2d5">
         </a>
         <a href="https://github.com/snowfallorg/lib" target="_blank">
            <img alt="Built With Snowfall" src="https://img.shields.io/static/v1?label=Built%20With&labelColor=303446&message=Snowfall&color=94e2d5&style=for-the-badge">
         </a>
         <a href="https://github.com/henrisota/inception/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=FAB387&logo=unlicense&logoColor=FAB387&labelColor=303446"/>
         </a>
      </div>
   </div>
</h1>

`inception` configuration for [Neovim](https://neovim.io/) in [Nix](https://nixos.org/) using [NixVim](https://nix-community.github.io/nixvim/) and [Flakes](https://)

## Installation

Add it as an input to your flake

```nix
inputs.inceptionvim.url = "github:henrisota/inceptionvim";
```

Set it as a package in your configuration

### Home Manager

```nix
home.packages = [inputs.inceptionvim.packages.${system}.default];
```

### NixOS

```nix
environment.systemPackages = [inputs.inceptionvim.packages.${system}.default];
```

## Development

To easily test the current `main` configuration, simply run the following command

```shell
nix run github:henrisota/inceptionvim
```

For local development and testing changes, clone the repository and run the following command

```shell
nix run .
```

Pass in arguments to `neovim` via operands

```
nix run github:henrisota/inceptionvim -- ./
```

## Structure

Configuration is set under [configuration](./configuration/) based on functional categories related to development rather than plugin-specific categories.

Overall flake structure follows [Snowfall](https://snowfall.org/).


### Plugins

This configuration utilizes the following plugins

| Plugin | In Use | Plugin | In Use |
| - | - | - | - |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | ✓ | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ✓ |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | ✓ | [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) | ✓ |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | ✓ | [noice.nvim](https://github.com/folke/noice.nvim) | ✓ |
| [lspkind-nvim](https://github.com/onsails/lspkind-nvim) | ✓ | [alpha-nvim](https://github.com/goolord/alpha-nvim) | ✗ |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | ✓ | [auto-session](https://github.com/rmagatti/auto-session) | ✓ |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | ✓ | [better-escape.nvim](https://github.com/max397574/better-escape.nvim) | ✓ |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | ✓ | [Comment.nvim](https://github.com/numToStr/Comment.nvim) | ✓ |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | ✓ | [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | ✓ |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | ✓ | [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) | ✗ |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | ✓ | [harpoon](https://github.com/ThePrimeagen/harpoon) | ✓ |
| [vim-nix](https://github.com/LnL7/vim-nix) | ✓ | [vim-illuminate](https://github.com/RRethy/vim-illuminate) | ✓ |
| [hmts.nvim](https://github.com/calops/hmts.nvim) | ✓ | [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | ✓ |
| [nix-develop.nvim](https://github.com/figsoda/nix-develop.nvim) | ✓ | [indent-o-matic](https://github.com/Darazaki/indent-o-matic) | ✓ |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | ✗ | [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy) | ✓ |
| [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor) | ✓ | [neogen](https://github.com/danymat/neogen) | ✓ |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | ✓ | [nvim-notify](https://github.com/rcarriga/nvim-notify) | ✓ |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | ✓ | [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | ✓ |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | ✓ | [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | ✓ |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | ✓ | [nvim-spider](https://github.com/chrisgrieser/nvim-spider) | ✓ |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | ✓ | [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | ✓ |
| [wtf.nvim](https://github.com/piersolenski/wtf.nvim) | ✓ | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | ✓ |
| [neotest](https://github.com/nvim-neotest/neotest) | ✓ | [undotree](https://github.com/mbbill/undotree) | ✓ |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | ✓ | [which-key.nvim](https://github.com/folke/which-key.nvim) | ✓ |
| [smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim) | ✓ |

## Testing

To run checks, simply run the following command

```shell
nix flake check --impure --all-systems
```
