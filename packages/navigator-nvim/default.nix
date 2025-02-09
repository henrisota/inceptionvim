{
  pkgs,
  lib,
  inputs,
  ...
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "navigator.nvim";
  version = "latest";
  src = inputs.navigator-nvim;

  meta = with lib; {
    description = "Smoothly navigate between neovim and terminal multiplexer(s)";
    homepage = "https://github.com/dynamotn/Navigator.nvim";
    license = licenses.mit;
  };
}
