{
  pkgs,
  lib,
  inputs,
  ...
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "typr";
  version = "latest";
  src = inputs.typr;

  buildInputs = [pkgs.flak.volt];

  meta = with lib; {
    description = "Typing practice plugin with good UI";
    homepage = "https://github.com/nvzone/typr";
    license = licenses.mit;
  };
}
