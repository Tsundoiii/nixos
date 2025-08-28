{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  services.printing.drivers = [ pkgs.hplipWithPlugin ];

  hardware = {
    printers = {
      ensurePrinters = [
        {
          name = "Printer";
          location = "Home";
          model = "HP/hp-laserjet_professional_m1212nf_mfp.ppd.gz";
          deviceUri = "usb://HP/LaserJet%20Professional%20M1212nf%20MFP?serial=000000000QJ46WG1PR1a";
        }
      ];
      ensureDefaultPrinter = "Printer";
    };

    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };

  environment.systemPackages = [ pkgs.simple-scan ];
}
