{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ usbutils ];

  users.users.tsundoiii = {
    isNormalUser = true;
    description = "Tsundoiii";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
