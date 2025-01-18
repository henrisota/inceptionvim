_self: _: prev: {
  vimPlugins = prev.vimPlugins.extend (
    _: _: {
      inherit (prev.pkgs.flak) bufresize-nvim;
      inherit (prev.pkgs.flak) typr;
      inherit (prev.pkgs.flak) volt;
    }
  );
}
