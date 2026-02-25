{
  imports = [
    ./niri/niri.nix
    ./quickshell/quickshell.nix
  ];

  programs.fuzzel.enable = true;
}
