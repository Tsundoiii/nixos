{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "desktop";
  environment.systemPackages = [ pkgs.simple-scan ];

  hardware = {
    graphics.extraPackages = [ pkgs.intel-vaapi-driver ];

    printers = {
      ensureDefaultPrinter = "Printer";

      ensurePrinters = [
        {
          name = "Printer";
          location = "Home";
          model = "HP/hp-laserjet_professional_m1212nf_mfp.ppd.gz";
          deviceUri = "usb://HP/LaserJet%20Professional%20M1212nf%20MFP?serial=000000000QJ46WG1PR1a";
        }
      ];
    };

    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };

  services = {
    xserver.videoDrivers = [ "modesetting" ];
    printing.drivers = [ pkgs.hplipWithPlugin ];
  };

  home-manager.users.tsundoiii.programs.niri.settings = {
    input.keyboard.numlock = true;

    binds = {
      "XF86Calculator".action.spawn-sh = [ "LIBGL_ALWAYS_SOFTWARE=1 ghostty" ];
      "XF86Explorer".action.spawn = [ "firefox" ];

      "Alt+XF86Explorer".action.spawn = [
        "firefox"
        "-p"
        "school"
      ];

      "XF86HomePage".action.spawn = [
        "vicinae"
        "open"
      ];
    };
  };
}
