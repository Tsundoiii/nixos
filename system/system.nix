{ pkgs, ... }:

{
  system = {
    stateVersion = "26.05";

    autoUpgrade = {
      enable = true;
      dates = "weekly";
      persistent = true;
      runGarbageCollection = true;
      flags = [ "--recreate-lock-file" ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      timeout = 2;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 2;
      };
    };
  };

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults pwfeedback";
  };
}
