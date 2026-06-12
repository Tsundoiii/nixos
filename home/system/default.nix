{
  imports = [
    ./firefox.nix
    ./ghostty.nix
    ./hyfetch.nix
    ./mako.nix
    ./password-store-browserpass.nix
    ./starship.nix
    ./vicinae.nix
  ];

  programs = {
    bash.enable = true;
    discord.enable = true;
  };
}
