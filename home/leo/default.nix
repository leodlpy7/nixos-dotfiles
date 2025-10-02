{
  config,
  pkgs,
  ...
}: {
  home = {
    stateVersion = "25.05";
    username = "leo";
    homeDirectory = "/home/leo";
  };

  programs.home-manager.enable = true;
}
