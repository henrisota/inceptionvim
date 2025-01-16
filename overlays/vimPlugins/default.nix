self: _: prev: {
  vimPlugins = prev.vimPlugins.extend (
    _: _: {
      bufresize-nvim = prev.pkgs.flak.bufresize-nvim;
    }
  );
}
