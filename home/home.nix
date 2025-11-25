{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    stateVersion = "25.05";

    username = "tsundoiii";
    homeDirectory = "/home/tsundoiii";

    packages = with pkgs; [
      kdePackages.dolphin
      kdePackages.filelight
      mpv
      qimgv
      grimblast

      hyfetch
      discord

      vscode
      nixd
      nixfmt-rfc-style
      #kicad

      #texlive.combined.scheme-medium

      prismlauncher
    ];
  };

  imports = [
    ./programs
  ];
}
