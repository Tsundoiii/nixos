{ pkgs, ... }:

{
  imports = [
    ./display
    ./programming
    ./system
  ];

  programs.home-manager.enable = true;

  home = {
    stateVersion = "26.05";

    username = "tsundoiii";
    homeDirectory = "/home/tsundoiii";

    packages = with pkgs; [
      nautilus
      kdePackages.filelight
      mpv
      qimgv
      libqalculate
      discord

      typst

      nixd
      nixfmt

      prismlauncher
      blahaj
    ];
  };

  stylix.targets.fuzzel.fonts.enable = false;
}
