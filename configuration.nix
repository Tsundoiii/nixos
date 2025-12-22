# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  system = {
    stateVersion = "25.05";

    autoUpgrade = {
      enable = true;
      dates = "weekly";
      persistent = true;
      runGarbageCollection = true;

      flags = [
        "--update-input"
        "nixpkgs"
        "--commit-lock-file"
      ];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  fileSystems = {
    "/".options = [ "compress=zstd" ];

    "/home".options = [ "compress=zstd" ];

    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];

    "/swap".options = [ "noatime" ];
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8 * 1024;
    }
  ];

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

    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        rime
        mozc-ut
      ];
    };
  };

  services = {
    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/" ];
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    upower.enable = true;
    usbmuxd.enable = true;
    printing.enable = true;
    blueman.enable = true;
  };

  networking.networkmanager.enable = true;

  security = {
    rtkit.enable = true;
    pam.services.hyprlock = { };
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    vim = {
      enable = true;
      defaultEditor = true;
    };

    hyprlock.enable = true;

    git.enable = true;
    steam.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    libimobiledevice
    ifuse
  ];

  users.users.tsundoiii = {
    isNormalUser = true;
    description = "Tsundoiii";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
    ];
  };

  stylix = {
    enable = true;

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.dejavu-sans-mono;
        name = "DejaVuSansM Nerd Font Mono";
      };
    };
  };
}
