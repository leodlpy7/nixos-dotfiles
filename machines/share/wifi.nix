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
      
      "LevelOne-2.4G" = {
      	pskRaw = "ext:LEVELONE_PSK";
	priority = 5;
      };

      "to huus" = {
      	pskRaw = "ext:TOHUUS_PSK";
	priority = 5;
      };
    };
  };

  # fucking easyroam config
  sops.secrets.easyroam = {
    format = "binary";
    sopsFile = ../../res/secrets/amaterasu.p12;
  };

  services.easyroam = {
    enable = true;
    pkcsFile = config.sops.secrets.easyroam.path;
    wpa-supplicant = {
      enable = true;
      extraConfig = ''
        priority=5
      '';
    };
  };
}
