{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "laptop";

  boot.loader.timeout = 2;

  services = {
    fprintd.enable = true;

    upower.enable = true;

    keyd = {
      enable = true;

      keyboards.default = {
        ids = [ "*" ];

        settings.main.leftcontrol = "noop";
      };
    };
  };
}
