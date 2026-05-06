{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services = {
    fwupd.enable = true;
    gvfs.enable = true;
    usbmuxd.enable = true;
    blueman.enable = true;
    displayManager.gdm.enable = true;

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
