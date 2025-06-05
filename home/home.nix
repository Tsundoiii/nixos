{ config, pkgs, ... }:

{
  home = {
    username = "tsundoiii";
    homeDirectory = "/home/tsundoiii";

    packages = with pkgs; [
      vscode
      discord
      hyfetch
    ];
  };

  programs.home-manager.enable = true;

  imports = [
    ./programs
  ];

  home.stateVersion = "25.05";
}