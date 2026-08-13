# Lifts this flake's own plugin packages into `pkgs.vimPlugins`, which is where
# the nixvim configuration modules look for them (`with pkgs.vimPlugins;`).
#
# Snowfall injected the package set as `pkgs.flak` implicitly; it is now passed
# in explicitly from nix/packages.nix.
{flak}: _final: prev: {
  vimPlugins = prev.vimPlugins.extend (
    _: _: {
      inherit
        (flak)
        bufresize-nvim
        lsp-progress-nvim
        typr
        volt
        ;
    }
  );
}
