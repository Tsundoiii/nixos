{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    mainBar = {
      modules-center = [ "clock" ];
    }
  };
}