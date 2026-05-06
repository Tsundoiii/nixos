{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
    ];
  };

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    fonts.monospace = {
      package = pkgs.nerd-fonts.dejavu-sans-mono;
      name = "DejaVuSansM Nerd Font Mono";
    };
  };
}
