{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = typr;
    }
    {
      plugin = volt;
    }
  ];
}
