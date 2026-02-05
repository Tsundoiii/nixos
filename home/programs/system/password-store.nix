{ pkgs, ... }:

{
  programs = {
    password-store = {
      enable = true;

      package = pkgs.pass.withExtensions (
        exts: with exts; [
          pass-import
        ]
      );
    };

    browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };
  };
}
