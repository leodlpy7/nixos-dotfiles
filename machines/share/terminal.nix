{
  config,
  inputs,
  outputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ outputs.packages.nixvim-okami ];
}
