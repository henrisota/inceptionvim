{
  lib,
  config,
  ...
}: {
  plugins = {
    auto-session = {
      enable = true;

      settings = {
        enabled = true;
        auto_restore = true;
        auto_save = true;
        auto_restore_last_session = true;
        use_git_branch = true;

        pre_save_cmds = lib.optional config.plugins.neo-tree.enable "Neotree close";
        pre_restore_cmds = [];
        post_restore_cmds = lib.optional config.plugins.neo-tree.enable "Neotree filesystem show";
      };
    };
  };
}
