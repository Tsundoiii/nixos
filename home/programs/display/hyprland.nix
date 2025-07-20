{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";

      exec-once = [ "firefox" "discord" ];
    
      bind = [
        "$mod, C, killactive,"
        "$mod, Q, exec, $terminal"
        "$mod, F, exec, firefox"
        "$mod, D, exec, discord"
        "$mod, V, exec, code"
      ] ++ (
        builtins.concatLists (builtins.genList (i: 
          let workspace = i + 1;
          in [
            "$mod, ${toString workspace}, workspace, ${toString workspace}"
            "$mod SHIFT, ${toString workspace}, movetoworkspace, ${toString workspace}"
          ]
        )
        9)
      );
    };
  };
}
