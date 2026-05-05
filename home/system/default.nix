{
  imports = [
    ./display
    ./firefox.nix
    ./hyfetch.nix
    ./password-store-browserpass.nix
    ./starship.nix
    ./vicinae.nix
  ];

  services.mako.enable = true;

  programs = {
    bash.enable = true;
    alacritty.enable = true;
  };
}
