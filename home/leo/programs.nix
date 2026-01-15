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
    prismlauncher
    gnucash
    nautilus
  ];

  programs.bat = {
    enable = true;
    config.theme = "Nord";
  };
}
