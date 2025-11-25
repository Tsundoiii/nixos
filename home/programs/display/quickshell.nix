{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    activeConfig = "/etc/nixos/home/programs/display/bar";
  };
}
