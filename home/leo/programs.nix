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
    bat
  ];
}
