# Vendored from snowfall-lib/fs/default.nix so the two call sites that collect
# nixvim configuration modules no longer depend on the unmaintained input.
# Recursive, and skips default.nix, matching upstream exactly.
{lib}: let
  getFilesRecursive = dir:
    lib.concatLists (lib.mapAttrsToList (
        entry: type: let
          path = "${dir}/${entry}";
        in
          if type == "directory"
          then getFilesRecursive path
          else [path]
      )
      (builtins.readDir dir));
in {
  getNonDefaultNixFilesRecursive = path:
    builtins.filter (
      name:
        lib.hasSuffix ".nix" name
        && builtins.baseNameOf name != "default.nix"
    )
    (getFilesRecursive path);
}
