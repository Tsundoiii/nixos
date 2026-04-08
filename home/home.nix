{ pkgs, ... }:

{
  imports = [
    ./display
    ./programming
    ./system
  ];

  programs.home-manager.enable = true;
  stylix.targets.fuzzel.fonts.enable = false;

  home = rec {
    stateVersion = "26.05";
    username = "tsundoiii";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      nautilus
      kdePackages.filelight
      libqalculate
      discord

      typst

      nixd
      nixfmt

      prismlauncher
      blahaj
    ];
  };
}
