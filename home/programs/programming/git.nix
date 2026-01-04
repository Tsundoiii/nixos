{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      signByDefault = true;
      key = "/home/tsundoiii/.ssh/id_ed25519.pub";
    };

    settings = {
      user = {
        name = "Tsundoiii";
        email = "dev@tsundoiii.dev";
      };

      init.defaultBranch = "main";
    };
  };
}
