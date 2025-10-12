# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  system.stateVersion = "25.05";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 2;
      };

      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Indiana/Indianapolis";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  services = {
    xserver = {
      enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    hypridle.enable = true;
    
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing.enable = true;
    blueman.enable = true;
  };

  networking.networkmanager.enable = true;

  security = {
    rtkit.enable = true;
    pam.services.hyprlock = {};
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    
    hyprlock.enable = true;

    git.enable = true;
    vim.enable = true;
    steam.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    kitty
  ];

  users.users.tsundoiii = {
    isNormalUser = true;
    description = "Tsundoiii";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
  ];
}
