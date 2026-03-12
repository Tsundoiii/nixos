{
  imports = [
    ./firefox.nix
    ./hyfetch.nix
    ./password-store.nix
    ./starship.nix
  ];

  programs = {
    bash.enable = true;
    alacritty.enable = true;
    fuzzel.enable = true;
  };
}
