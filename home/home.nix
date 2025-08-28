{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home = {
    stateVersion = "25.05";

    username = "tsundoiii";
    homeDirectory = "/home/tsundoiii";

    packages = with pkgs; [
      nautilus
      vscode
      discord
      hyfetch
      prismlauncher
      grimblast
      texlive.combined.scheme-basic
    ];
  };

  imports = [
    ./programs
  ];
}