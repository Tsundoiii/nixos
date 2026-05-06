{ lib, ... }:

{
  programs.niri.settings = {
    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/Screenshot %Y-%m-%d %H-%M-%S.png";
    hotkey-overlay.skip-at-startup = true;

    spawn-at-startup = [
      { argv = [ "firefox" ]; }

      {
        argv = [
          "ibus"
          "start"
          "--type"
          "wayland"
        ];
      }
    ];

    input = {
      keyboard.numlock = true;
      warp-mouse-to-focus.enable = true;

      touchpad = {
        tap = true;
        natural-scroll = true;
      };

      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
    };

    binds = {
      "Print".action.screenshot = [ ];
      "Ctrl+Print".action.screenshot-screen = [ ];
      "Alt+Print".action.screenshot-window = [ ];

      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;

        action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.05+"
          "-l"
          "1.0"
        ];
      };

      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.05-"
        ];
      };

      "XF86AudioMute" = {
        allow-when-locked = true;

        action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];
      };

      "XF86AudioMicMute" = {
        allow-when-locked = true;

        action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SOURCE@"
          "toggle"
        ];
      };

      "XF86MonBrightnessUp" = {
        allow-when-locked = true;

        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "+10%"
        ];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;

        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "10%-"
        ];
      };

      "XF86Explorer".action.spawn = [ "firefox" ];
      "XF86Bluetooth".action.spawn = [ "blueman-manager" ];

      "XF86Tools".action.spawn = [
        "code"
        "/etc/nixos"
      ];

      "XF86Favorites".action.spawn = [
        "vicinae"
        "open"
      ];

      "Mod+Left".action.focus-column-left = [ ];
      "Mod+Right".action.focus-column-right = [ ];
      "Mod+Up".action.focus-window-or-workspace-up = [ ];
      "Mod+Down".action.focus-window-or-workspace-down = [ ];

      "Mod+Ctrl+Left".action.move-column-left = [ ];
      "Mod+Ctrl+Right".action.move-column-right = [ ];
      "Mod+Ctrl+Up".action.move-window-up-or-to-workspace-up = [ ];
      "Mod+Ctrl+Down".action.move-window-down-or-to-workspace-down = [ ];

      "Mod+Alt+Up".action.focus-workspace-up = [ ];
      "Mod+Alt+Down".action.focus-workspace-down = [ ];
      "Mod+Ctrl+Alt+Up".action.move-workspace-up = [ ];
      "Mod+Ctrl+Alt+Down".action.move-workspace-down = [ ];

      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = [ ];
      };

      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = [ ];
      };

      "Mod+Ctrl+WheelScrollUp" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-up = [ ];
      };

      "Mod+Ctrl+WheelScrollDown" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-down = [ ];
      };

      "Mod+Shift+Left".action.focus-monitor-left = [ ];
      "Mod+Shift+Right".action.focus-monitor-right = [ ];
      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [ ];
      "Mod+Shift+Ctrl+Alt+Left".action.move-workspace-to-monitor-left = [ ];
      "Mod+Shift+Ctrl+Alt+Right".action.move-workspace-to-monitor-right = [ ];

      "Mod+Home".action.focus-column-first = [ ];
      "Mod+End".action.focus-column-last = [ ];
      "Mod+Ctrl+Home".action.move-column-to-first = [ ];
      "Mod+Ctrl+End".action.move-column-to-last = [ ];

      "Mod+Tab".action.focus-workspace-previous = [ ];

      "Mod+W".action.toggle-column-tabbed-display = [ ];

      "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
      "Mod+BracketRight".action.consume-or-expel-window-right = [ ];

      "Mod+Comma".action.consume-window-into-column = [ ];
      "Mod+Period".action.expel-window-from-column = [ ];

      "Mod+R".action.switch-preset-column-width = [ ];
      "Mod+Shift+R".action.switch-preset-window-height = [ ];
      "Mod+F".action.maximize-column = [ ];
      "Mod+C".action.center-column = [ ];

      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";
      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      "Mod+V".action.toggle-window-floating = [ ];
      "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [ ];

      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = [ ];
      };

      "Mod+O" = {
        repeat = false;
        action.toggle-overview = [ ];
      };

      "Mod+Q" = {
        repeat = false;
        action.close-window = [ ];
      };

      "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
      "Ctrl+Alt+Delete".action.quit = [ ];

      "Mod+T".action.spawn = [ "alacritty" ];

      "Mod+P".action.spawn = [
        "firefox"
        "-p"
        "school"
      ];
    }
    // lib.mergeAttrsList (
      builtins.genList (
        i:
        let
          workspace = i + 1;
        in
        {
          "Mod+${toString workspace}".action.focus-workspace = workspace;
          "Mod+Ctrl+${toString workspace}".action.move-column-to-workspace = workspace;
        }
      ) 9
    );

    layout = {
      gaps = 15;
      default-column-width.proportion = 1.0;
      focus-ring.width = 2;

      preset-column-widths = [
        { proportion = 0.5; }
        { proportion = 1.0; }
      ];

      preset-window-heights = [
        { proportion = 0.5; }
        { proportion = 1.0; }
      ];
    };

    window-rules = [
      {
        clip-to-geometry = true;

        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
      }

      {
        matches = [ { is-focused = false; } ];
        opacity = 0.5;
      }

      {
        matches = [
          {
            app-id = "steam";
            title = "^notificationtoasts_\\d+_desktop$";
          }
        ];

        default-floating-position = {
          x = 10;
          y = 10;
          relative-to = "top-right";
        };
      }
    ];
  };
}
