{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      waylandFrontend = true;

      addons = with pkgs; [
        fcitx5-rime
        fcitx5-mozc-ut
      ];

      settings = {
        inputMethod = {
          "GroupOrder"."0" = "Default";

          "Groups/0" = {
            "Name" = "Default";
            "Default Layout" = "us";
            "DefaultIM" = "rime";
          };

          "Groups/0/Items/0"."Name" = "keyboard-us";
          "Groups/0/Items/1"."Name" = "rime";
          "Groups/0/Items/2"."Name" = "mozc";
        };

        addons."classicui".globalSection."Vertical Candidate List" = true;
      };
    };
  };
}
