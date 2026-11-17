{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.symbols-only
    ];
  };

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    fonts.monospace = {
      package = pkgs.ioskeley-mono.nl;
      name = "Ioskeley Mono NL";
    };
  };
}
