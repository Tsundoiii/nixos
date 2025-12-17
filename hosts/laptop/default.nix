{
  imports = [ ./hardware-configuration.nix ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];

    "/home" = {
      device = "/dev/disk/by-uuid/64895545-52b1-4cfe-a0ae-b1b7f6668db5";

      options = [
        "subvol=home"
        "compress=zstd"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/64895545-52b1-4cfe-a0ae-b1b7f6668db5";

      options = [
        "subvol=nix"
        "compress=zstd"
        "noatime"
      ];
    };

    "/swap".options = [ "noatime" ];
  };

  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/" ];
  };

  networking.hostName = "laptop";

  services.fprintd.enable = true;

  hardware = {
    printers = {
      ensurePrinters = [
        {
          name = "itap-printing";
          description = "Purdue Black and White Printing";
          deviceUri = "lpd://chen5708@wpvapppcprt02.itap.purdue.edu:515/itap-printing";
          model = "drv:///sample.drv/generic.ppd";
        }

        {
          name = "itap-colorprinting";
          description = "Purdue Color Printing";
          deviceUri = "lpd://chen5708@wpvapppcprt02.itap.purdue.edu:515/itap-colorprinting";
          model = "drv:///sample.drv/generic.ppd";
        }
      ];
    };
  };
}
