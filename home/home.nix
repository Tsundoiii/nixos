{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home = {
    stateVersion = "25.05";

    username = "tsundoiii";
    homeDirectory = "/home/tsundoiii";

    packages = with pkgs; [
      nautilus
      kdePackages.filelight

      hyfetch
      discord

      vscode
      kicad

      texlive.combined.scheme-full

      prismlauncher
    ];
  };

  imports = [
    ./programs
  ];
}