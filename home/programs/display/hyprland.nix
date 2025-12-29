{ lib, ... }:

let
  menu = prompt: options: ''
    case $(echo -e "${builtins.concatStringsSep "\\n" (builtins.catAttrs "name" options)}" | fuzzel --dmenu --prompt="${prompt}") in
      ${lib.strings.concatMapStrings (option: ''
        "${option.name}")
        ${option.command}
        ;;
      '') options}
      esac
  '';

  power = builtins.toFile "power.sh" (
    menu "Power" [
      {
        name = "Shut Down";
        command = "poweroff";
      }

      {
        name = "Reboot";
        command = "reboot";
      }

      {
        name = "Suspend";
        command = "systemctl suspend";
      }
    ]
  );

  network = builtins.toFile "network.sh" "nmcli dev wifi con $(nmcli -t -f name connection show | fuzzel --dmenu --prompt=Network)";

  screenshot = builtins.toFile "screenshot.sh" (
    menu "Screenshot" [
      {
        name = "Area (Copy)";
        command = "grimblast copy area";
      }

      {
        name = "Area (Save + Copy)";
        command = "grimblast copysave area";
      }

      {
        name = "Window (Copy)";
        command = "grimblast copy active";
      }

      {
        name = "Window (Save + Copy)";
        command = "grimblast copysave active";
      }

      {
        name = "Screen (Copy)";
        command = "grimblast copy output";
      }

      {
        name = "Screen (Save + Copy)";
        command = "grimblast copysave output";
      }
    ]
  );

  system = builtins.toFile "system.sh" (
    menu "System" [
      {
        name = "Power";
        command = "sh ${power}";
      }

      {
        name = "Network";
        command = "sh ${network}";
      }

      {
        name = "Screenshot";
        command = "sh ${screenshot}";
      }
    ]
  );
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "monitor" = ",highres,auto,1";
      "$mod" = "SUPER";

      exec-once = [
        "firefox"
        "ibus start --type wayland"
      ];

      xwayland.force_zero_scaling = true;

      bind = [
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        ", F11, fullscreen"
        ", Print, exec, sh ${screenshot}"

        "$mod, C, killactive,"
        "$mod, Q, exec, alacritty"
        "$mod, B, exec, firefox"
        "$mod, P, exec, firefox -P school"
        "$mod, R, exec, fuzzel"
        "$mod, S, exec, sh ${system}"

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

        inactive_opacity = 0.75;
      };

      gesture = "3, horizontal, workspace";
    };
  };
}
