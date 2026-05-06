{
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/swap".options = [ "noatime" ];

    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8 * 1024;
    }
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
