{ nix-vscode-extensions, ... }:

{
  nix.settings = {
    warn-dirty = false;

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
