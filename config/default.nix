{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./bufferline.nix
    ./colorscheme.nix
    ./completion.nix
    ./debug.nix
    ./editor.nix
    ./file-explorer.nix
    ./git.nix
    ./harpoon.nix
    ./icons.nix
    ./indentation.nix
    ./language-servers.nix
    ./keymappings.nix
    ./options.nix
    ./sessions.nix
    ./splits.nix
    ./startup.nix
    ./statusline.nix
    ./telescope.nix
    ./terminal.nix
    ./testing.nix
    ./treesitter.nix

    ./languages/bash.nix
    ./languages/c.nix
    ./languages/cpp.nix
    ./languages/css.nix
    ./languages/docker.nix
    ./languages/go.nix
    ./languages/helm.nix
    ./languages/html.nix
    ./languages/java.nix
    ./languages/javascript.nix
    ./languages/json.nix
    ./languages/kotlin.nix
    ./languages/lua.nix
    ./languages/markdown.nix
    ./languages/nix.nix
    ./languages/python.nix
    ./languages/rust.nix
    ./languages/sh.nix
    # TODO: Include again once https://github.com/NixOS/nixpkgs/pull/332824 is merged
    # ./languages/sql.nix
    ./languages/terraform.nix
    ./languages/toml.nix
    ./languages/typescript.nix
    ./languages/xml.nix
    ./languages/yaml.nix
  ];

  viAlias = true;
  vimAlias = true;
}
