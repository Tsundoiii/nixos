{
  imports = [
    ./quickshell/quickshell.nix
    ./hyprland.nix
  ];

  services.hyprpaper.enable = true;

  programs.fuzzel.enable = true;
}
