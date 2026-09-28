{
  pkgs,
  lib,
  inputs,
  ...
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "lsp-progress.nvim";
  version = "latest";
  src = inputs.lsp-progress-nvim;

  # Test bootstrap in the repo root, not loadable outside its test harness
  nvimSkipModules = ["spec_init"];

  meta = with lib; {
    description = "A performant lsp progress status for Neovim";
    homepage = "https://github.com/linrongbin16/lsp-progress.nvim";
    license = licenses.mit;
  };
}
