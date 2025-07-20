{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "battery" "pulseaudio" "privacy" ];

        "clock".timezone = "America/Indiana/Indianapolis";
        "network".format = "{essid}";
      };
    };
  };
}