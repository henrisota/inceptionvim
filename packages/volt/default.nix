{
  pkgs,
  lib,
  inputs,
  ...
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "volt";
  version = "latest";
  src = inputs.volt;

  meta = with lib; {
    description = " Plugin for creating reactive UI in Neovim";
    homepage = "https://github.com/nvzone/volt";
    license = licenses.gpl3;
  };
}
