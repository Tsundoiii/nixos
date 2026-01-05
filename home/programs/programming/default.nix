{
  imports = [
    ./direnv.nix
    ./git.nix
    ./vim.nix
    ./vscode.nix
  ];

  programs.alacritty.enable = true;
}
