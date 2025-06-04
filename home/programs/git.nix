{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Tsundoiii";
    userEmail = "91398247+Tsundoiii@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}