{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services = {
    fwupd.enable = true;
    usbmuxd.enable = true;
    gvfs.enable = true;
    blueman.enable = true;
    automatic-timezoned.enable = true;
    xserver.enable = true;

    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/" ];
    };

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
  };

  programs = {
    niri.enable = true;
    steam.enable = true;
    gnupg.agent.enable = true;

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
