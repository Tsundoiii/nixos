{
  programs.vicinae = {
    enable = true;
    systemd.enable = true;

    settings.favorites = [
      "power:power-off"
      "power:reboot"
      "power:sleep"
      "system:run"
    ];
  };
}
