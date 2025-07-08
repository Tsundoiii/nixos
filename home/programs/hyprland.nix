{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, F, exec, firefox"
    ] ++ (
      builtins.concatLists (builtins.genList (i: 
        let workspace = i + 1;
        in [
          "$mod, code1${toString i}, workspace, ${toString workspace}"
          "$mod SHIFT, code1${toString i}, movetoworkspace, ${toString workspace}"
        ]
      )
      9)
    );
  };
}