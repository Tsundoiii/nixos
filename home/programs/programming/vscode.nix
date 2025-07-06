{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
    profiles.default = {
      userSettings = {
        "git.autofetch" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.formatOnType" = true;
        "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
        "files.autoSave" = "onFocusChange";
        "telemetry.telemetryLevel" = "error";
      };

      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
      ];
    };
  };
}