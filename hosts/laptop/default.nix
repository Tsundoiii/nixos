{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "laptop";

  services = {
    fprintd.enable = true;
    upower.enable = true;

    keyd = {
      enable = true;

      keyboards.default = {
        ids = [ "*" ];

        settings.main.leftcontrol = "noop";
      };
    };

    resolved.enable = true;
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };

  home-manager.users.tsundoiii.programs.niri.settings = {
    input.touchpad = {
      tap = true;
      natural-scroll = true;
    };

    binds = {
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;

        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "+5%"
        ];
      };

      "XF86MonBrightnessDown" = {
        allow-when-locked = true;

        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "5%-"
        ];
      };

      "XF86Tools".action.spawn = [
        "vicinae"
        "open"
      ];

      "XF86Bluetooth".action.spawn = [ "blueman-manager" ];
      "XF86Launch5".action.spawn = [ "ghostty" ];
      "XF86Favorites".action.spawn = [ "firefox" ];

      "Alt+XF86Favorites".action.spawn = [
        "firefox"
        "-p"
        "school"
      ];
    };
  };
}
