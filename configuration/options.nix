{
  config,
  lib,
  ...
}: {
  globals = {
    mapleader = " ";
    maplocalleader = ",";

    # Disable providers
    loaded_node_provider = 0;
    loaded_perl_provider = 0;
    loaded_python3_provider = 0;
    loaded_ruby_provider = 0;
  };

  opts = {
    # Buffers
    hidden = true;

    # Colors
    termguicolors = true;

    # Encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    fillchars = {
      eob = " ";
    };

    # History
    undofile = true;
    swapfile = !config.plugins.undotree.enable;
    backup = !config.plugins.undotree.enable;

    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;

    # Text wrap
    textwidth = 120;
    wrap = false;

    # Spelling
    spell = false;
    spelllang = lib.mkDefault ["en_us"];

    # Splitting
    splitbelow = true;
    splitright = true;

    # Tab
    softtabstop = 4;
    tabstop = 4;
    expandtab = true;

    # Indentation
    autoindent = false;
    shiftwidth = 4;
    smartindent = true;
    breakindent = true;

    # Cursorline
    cursorline = true;

    # Relative line numbers
    number = true;
    relativenumber = true;

    numberwidth = 4;
    ruler = false;

    # Signcolumn
    signcolumn = "yes";

    timeout = true;
    timeoutlen = 250;

    updatetime = 100;

    # Folding
    foldenable = true;
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99; # Using ufo needs a large value

    lazyredraw = false; # Faster scrolling if enabled, breaks noice
  };
}
