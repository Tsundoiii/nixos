{ pkgs, ... }:

{
  imports = [ ./programs ];

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
      jq

      discord

      nixd
      nixfmt

      prismlauncher
    ];
  };

  stylix.targets.fuzzel.fonts.enable = false;
}
