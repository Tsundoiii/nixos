{
  programs.ghostty = {
    enable = true;

    settings = {
      quit-after-last-window-closed-delay = "5m";
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
    };
  };
}
