{
  imports = [
    ./firefox.nix
    ./hyfetch.nix
    ./password-store-browserpass.nix
    ./starship.nix
  ];

  services.mako.enable = true;

  programs = {
    bash.enable = true;
    alacritty.enable = true;
    fuzzel.enable = true;
    mpv.enable = true;
  };
}
