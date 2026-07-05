{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      usbutils
      brightnessctl
      libimobiledevice
      ifuse
      xwayland-satellite
    ];
  };

  users.users.tsundoiii = {
    isNormalUser = true;
    description = "Tsundoiii";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
