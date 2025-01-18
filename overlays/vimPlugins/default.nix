_self: _: prev: {
  vimPlugins = prev.vimPlugins.extend (
    _: _: {
      inherit
        (prev.pkgs.flak)
        bufresize-nvim
        lsp-progress-nvim
        typr
        volt
        ;
    }
  );
}
