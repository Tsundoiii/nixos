{ pkgs, ... }:

{
  system = {
    stateVersion = "26.05";

    autoUpgrade = {
      enable = true;
      dates = "weekly";
      persistent = true;
      runGarbageCollection = true;
      flags = [ "--recreate-lock-file" ];
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

  hardware = {
    graphics.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
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
    fwupd.enable = true;
    gvfs.enable = true;
    usbmuxd.enable = true;
    printing.enable = true;
    blueman.enable = true;

    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/" ];
    };

    # greetd = {
    #   enable = true;
    #   settings = rec {
    #     initial_session = {
    #       command = "${pkgs.hyprland}/bin/start-hyprland";
    #       user = "tsundoiii";
    #     };

    #     default_session = initial_session;
    #   };
    # };

    displayManager.gdm.enable = true;

    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  programs = {
    niri.enable = true;
    gnupg.agent.enable = true;
    steam.enable = true;

    git = {
      enable = true;
      config.safe.directory = "/etc/nixos";
    };

    vim = {
      enable = true;
      defaultEditor = true;
    };
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIRI_CONFIG = "/etc/nixos/home/display/config.kdl";
    };

    systemPackages = with pkgs; [
      xwayland-satellite
      brightnessctl
      libimobiledevice
      ifuse
    ];
  };

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
