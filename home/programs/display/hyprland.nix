{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "monitor" = ",highres,auto,1";
      "$mod" = "SUPER";

      exec-once = [
        "firefox"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      bind = [
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        ", Print, exec, grimblast copy area"

        "$mod, C, killactive,"
        "$mod, Q, exec, alacritty"
        "$mod, F, exec, firefox"
        "$mod, P, exec, firefox -P school"
        "$mod, R, exec, rofi -show drun"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            workspace = i + 1;
          in
          [
            "$mod, ${toString workspace}, workspace, ${toString workspace}"
            "$mod SHIFT, ${toString workspace}, movetoworkspace, ${toString workspace}"
          ]
        ) 9
      ));

      decoration = {
        rounding = 10;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 0.75;
      };

      gesture = "3, horizontal, workspace";
    };
  };
}
