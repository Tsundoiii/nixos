{
  imports = [
    ./mpv.nix
    ./thunderbird.nix
  ];

  programs = {
    obs-studio.enable = true;
    discord.enable = true;
    prismlauncher.enable = true;
  };
}
