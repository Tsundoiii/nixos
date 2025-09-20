{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
    profiles.default = {
      userSettings = {
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.openRepositoryInParentFolders" = "always";

        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.formatOnType" = true;
        "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;

        "files.autoSave" = "onFocusChange";
        "explorer.confirmDragAndDrop" = false;
        "telemetry.telemetryLevel" = "error";

        "python.analysis.typeCheckingMode" = "strict";
        "latex-workshop.formatting.latex" = "latexindent";
      };

      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        mkhl.direnv
      ];
    };
  };
}