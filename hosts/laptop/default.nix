{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "laptop";

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
