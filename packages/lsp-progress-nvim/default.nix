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

  meta = with lib; {
    description = "A performant lsp progress status for Neovim";
    homepage = "https://github.com/linrongbin16/lsp-progress.nvim";
    license = licenses.mit;
  };
}
