{
  imports = [
    ./firefox.nix
    ./hyfetch.nix
    ./password-store.nix
  ];

  programs.alacritty.enable = true;
}
