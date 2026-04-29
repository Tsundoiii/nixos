{
  imports = [
    ./display
    ./firefox.nix
    ./hyfetch.nix
    ./password-store-browserpass.nix
    ./starship.nix
    ./thunderbird.nix
    ./vicinae.nix
  ];

  services.mako.enable = true;

  programs = {
    bash.enable = true;
    alacritty.enable = true;
    obs-studio.enable = true;
    discord.enable = true;
    prismlauncher.enable = true;
  };
}
