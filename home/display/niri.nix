{ lib, ... }:

{
  programs.niri = {
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot %Y-%m-%d %H-%M-%S.png";
      hotkey-overlay.skip-at-startup = true;

      spawn-at-startup = [
        { argv = [ "firefox" ]; }
      ];

      input = {
        warp-mouse-to-focus.enable = true;

        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };
      };

      binds = {
        "Ctrl+Alt+Delete".action.quit = [ ];

        "Print".action.screenshot = [ ];
        "Shift+Print".action.screenshot-screen = [ ];
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

        "Mod+Delete" = {
          allow-inhibiting = false;
          action.toggle-keyboard-shortcuts-inhibit = [ ];
        };

        "Mod+grave" = {
          repeat = false;
          action.toggle-overview = [ ];
        };

        "Mod+Escape" = {
          repeat = false;
          action.close-window = [ ];
        };

        "Mod+Slash".action.show-hotkey-overlay = [ ];

        "Mod+XF86WakeUp".action.toggle-window-floating = [ ];
        "Mod+Alt+XF86WakeUp".action.switch-focus-between-floating-and-tiling = [ ];

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

        "Mod+Insert".action.toggle-column-tabbed-display = [ ];

        "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
        "Mod+BracketRight".action.consume-or-expel-window-right = [ ];

        "Mod+Comma".action.consume-window-into-column = [ ];
        "Mod+Period".action.expel-window-from-column = [ ];

        "Mod+Caps_Lock".action.switch-preset-column-width = [ ];
        "Mod+Alt+Caps_Lock".action.switch-preset-window-height = [ ];
        "Mod+Ctrl+Caps_Lock".action.center-column = [ ];
        "Mod+Shift+Caps_Lock".action.maximize-column = [ ];

        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Alt+Minus".action.set-window-height = "-10%";
        "Mod+Alt+Equal".action.set-window-height = "+10%";
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
          matches = [ { is-active = false; } ];
          opacity = 0.75;
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
  };
}
