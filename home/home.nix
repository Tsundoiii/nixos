{ pkgs, ... }:

{
  imports = [
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

      typst

      nixd
      nixfmt

      blahaj
    ];
  };
}
