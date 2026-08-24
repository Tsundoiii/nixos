{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "desktop";

  hardware.graphics.extraPackages = [ pkgs.intel-vaapi-driver ];

  services.xserver.videoDrivers = [ "modesetting" ];

  home-manager.users.tsundoiii.programs.niri.settings = {
    input.keyboard.numlock = true;

    binds = {
      "XF86Calculator".action.spawn-sh = [ "LIBGL_ALWAYS_SOFTWARE=1 ghostty" ];
      "XF86Explorer".action.spawn = [ "firefox" ];

      "Alt+XF86Explorer".action.spawn = [
        "firefox"
        "-p"
        "school"
      ];

      "XF86HomePage".action.spawn = [
        "vicinae"
        "open"
      ];
    };
  };
}
