{
  imports = [
    ./firefox.nix
    ./ghostty.nix
    ./hyfetch.nix
    ./i18n.nix
    ./mako.nix
    ./password-store-browserpass.nix
    ./ssh.nix
    ./starship.nix
    ./vicinae.nix
  ];

  programs = {
    bash.enable = true;
    discord.enable = true;
  };
}
