{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home = {
    username = "tsundoiii";
    homeDirectory = "/home/tsundoiii";

    packages = with pkgs; [
      vscode
      discord
      hyfetch
      prismlauncher
    ];
  };

  imports = [
    ./programs
  ];

  home.stateVersion = "25.05";
}