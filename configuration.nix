{ pkgs, nix-vscode-extensions, ... }:

{
  networking.networkmanager.enable = true;
  time.timeZone = "America/Indiana/Indianapolis";

  nix.settings = {
    warn-dirty = false;

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    overlays = [ nix-vscode-extensions.overlays.default ];
    config.allowUnfree = true;
  };

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/swap".options = [ "noatime" ];

    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
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

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      timeout = 2;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 2;
      };
    };
  };

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults pwfeedback";
  };

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

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    systemPackages = with pkgs; [
      usbutils
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

    fonts.monospace = {
      package = pkgs.nerd-fonts.dejavu-sans-mono;
      name = "DejaVuSansM Nerd Font Mono";
    };
  };
}
