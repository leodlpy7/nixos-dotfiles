{
  config,
  pkgs,
  sops,
  ...
}: {
  sops.secrets.wifi = {
    format = "binary";
    sopsFile = ../../res/secrets/wifi;
  };

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    secretsFile = config.sops.secrets.wifi.path;
    fallbackToWPA2 = false;
    networks = {
      HHUD-Y = {
        pskRaw = "ext:HUDDY_PSK";
	priority = 3;
      };

      LambdaAufDemEFeld = {
        pskRaw = "ext:LAMBDA_AUF_DEM_E_FELD_PSK";
	priority = 3;
      };
    };
  };
}
