{
  programs.hyfetch = {
    enable = true;

    settings = {
      preset = "transfeminine";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.65;

      color_align = {
        mode = "custom";

        custom_colors = {
            "1" = 3;
            "2" = 0;
        };
      };

      backend = "neofetch";
    };
  };
}