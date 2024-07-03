{
  config,
  lib,
  pkgs,
  ...
}: {
  plugins = {
    auto-session = {
      enable = true;
      autoRestore.enabled = true;
      autoSave.enabled = true;
      autoSession = {
        enabled = true;
        enableLastSession = false;
        useGitBranch = true;
      };
    };

    persistence = {
      enable = false;
      options = ["buffers" "curdir" "tabpages" "winsize"];
      saveEmpty = false;
    };
  };
}
