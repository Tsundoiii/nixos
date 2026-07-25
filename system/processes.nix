{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services = {
    fwupd.enable = true;
    usbmuxd.enable = true;
    gvfs.enable = true;
    automatic-timezoned.enable = true;
    xserver.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    printing = {
      enable = true;

      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };

    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/" ];
    };
  };

  programs = {
    niri.enable = true;
    steam.enable = true;
    localsend.enable = true;
    gnupg.agent.enable = true;

    nix-ld = {
      enable = true;
      libraries = [ pkgs.libusb1 ];
    };

    nh = {
      enable = true;
      clean.enable = true;
    };

    git = {
      enable = true;
      config.safe.directory = "/etc/nixos";
    };

    vim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
