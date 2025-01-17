self: _: prev: {
  vimPlugins = prev.vimPlugins.extend (
    _: _: {
      bufresize-nvim = prev.pkgs.flak.bufresize-nvim;
      typr = prev.pkgs.flak.typr;
      volt = prev.pkgs.flak.volt;
    }
  );
}
