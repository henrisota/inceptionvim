{
  config,
  lib,
  pkgs,
  ...
}: {
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  opts = {
    # Colors
    termguicolors = true;

    # Encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Incremental searching
    hlsearch = true;
    incsearch = true;

    # Text wrap
    textwidth = 120;
    wrap = true;

    # Splitting
    splitbelow = true;
    splitright = true;

    # Tab
    softtabstop = 4;
    tabstop = 4;
    expandtab = true;

    # Indentation
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

    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99; # Using ufo needs a large value
    foldenable = true;

    # lazyredraw = false; # Faster scrolling if enabled, breaks noice
  };
}
