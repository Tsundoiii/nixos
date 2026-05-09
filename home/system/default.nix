{
  imports = [
    ./display
    ./firefox.nix
    ./hyfetch.nix
    ./mako.nix
    ./password-store-browserpass.nix
    ./starship.nix
    ./vicinae.nix
  ];

  programs = {
    bash.enable = true;
    alacritty.enable = true;
  };
}
