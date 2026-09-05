{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    usbutils
    openconnect
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
