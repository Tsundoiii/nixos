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
      jq

      typst

      discord

      nixd
      nixfmt

      prismlauncher
    ];
  };

  stylix.targets.fuzzel.fonts.enable = false;
}
