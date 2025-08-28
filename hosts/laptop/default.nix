{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  hardware.printers = {
    ensurePrinters = [
      {
        name = "itap-printing";
        description = "Purdue Black and White Printing";
        deviceUri = "lpd://chen5708@wpvapppcprt02.itap.purdue.edu:515/itap-printing";
        model = "drv:///sample.drv/generic.ppd";
      }
      {
        name = "itap-colorprinting";
        description = "Purdue Black and White Printing";
        deviceUri = "lpd://chen5708@wpvapppcprt02.itap.purdue.edu:515/itap-colorprinting";
        model = "drv:///sample.drv/generic.ppd";
      }
    ];
  };
}