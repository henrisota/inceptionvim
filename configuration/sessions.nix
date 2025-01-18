_: {
  plugins = {
    auto-session = {
      enable = true;

      settings = {
        enabled = true;
        auto_restore = true;
        auto_save = true;
        auto_restore_last_session = true;
        use_git_branch = true;
      };
    };
  };
}
