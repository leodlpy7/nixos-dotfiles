{
  config,
  outputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = [ outputs.packages.nixvim-okami ];
}
