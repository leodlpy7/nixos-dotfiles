{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    vlc
    discord
    signal-desktop
    xournalpp
  ];

  programs.bat = {
    enable = true;
    config.theme = "Nord";
  };
}
