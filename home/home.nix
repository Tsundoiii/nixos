{ pkgs, ... }:

{
  imports = [
    ./display
    ./media
    ./programming
    ./system
  ];

  programs.home-manager.enable = true;

  home = rec {
    stateVersion = "26.05";
    username = "tsundoiii";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      wev
      nautilus
      kdePackages.filelight

      devenv

      nixd
      nixfmt

      kicad
      pineflash

      typst

      blahaj
    ];
  };
}
