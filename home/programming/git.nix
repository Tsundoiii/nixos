{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      key = "/home/tsundoiii/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      init.defaultBranch = "main";

      push.autoSetupRemote = true;

      user = {
        name = "Tsundoiii";
        email = "dev@tsundoiii.dev";
      };
    };
  };
}
