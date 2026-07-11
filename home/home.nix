{ pkgs, ... }:

{
  imports = [
    ./display
    ./media
    ./programming
    ./system
  ];

  programs.home-manager.enable = true;

  home = {
    stateVersion = "26.11";

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
