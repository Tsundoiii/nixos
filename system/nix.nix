{ nix-vscode-extensions, ... }:

{
  nix.settings = {
    warn-dirty = false;
    trusted-substituters = [ "https://niri-epireyn.cachix.org" ];
    trusted-public-keys = [ "niri-epireyn.cachix.org-1:tlVyFN7CtsDT+ZcLPS+ekFWeT1X6X4OqvWqbBMyIzFA=" ];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    overlays = [ nix-vscode-extensions.overlays.default ];
    config.allowUnfree = true;
  };
}
