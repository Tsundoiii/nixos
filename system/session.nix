{ pkgs, ... }:

{
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      usbutils
      brightnessctl
      libimobiledevice
      ifuse
    ];
  };

  users.users.tsundoiii = {
    isNormalUser = true;
    description = "Tsundoiii";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
