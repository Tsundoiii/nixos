{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    usbutils
    xwayland-satellite
  ];

  users.users.tsundoiii = {
    isNormalUser = true;
    description = "Tsundoiii";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
