{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.secondarySideBar.defaultVisibility" = "hidden";

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

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };

        "python.analysis.typeCheckingMode" = "strict";
        "latex-workshop.formatting.latex" = "latexindent";
      };

      extensions = with pkgs.vscode-extensions; [
        ms-vscode-remote.remote-ssh
        mkhl.direnv
        jnoortheen.nix-ide
      ];
    };
  };
}
