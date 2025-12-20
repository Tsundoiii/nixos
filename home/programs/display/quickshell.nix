{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    activeConfig = toString /etc/nixos/home/programs/display/quickshell;
  };
}
