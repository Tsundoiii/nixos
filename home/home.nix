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
      nautilus
      kdePackages.filelight

      devenv

      nixd
      nixfmt

      typst

      kicad

      blahaj
    ];
  };
}
