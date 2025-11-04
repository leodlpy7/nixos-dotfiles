{
  config,
  pkgs,
  ...
}:
{
  # nixos cli helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 10";
    flake = "${config.users.users.leo.home}/.nix-config/dotfiles";
  };
}
