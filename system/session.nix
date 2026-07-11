{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      usbutils
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
