{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.secondarySideBar.defaultVisibility" = "hidden";
        "files.autoSave" = "onFocusChange";
        "explorer.confirmDragAndDrop" = false;
        "telemetry.telemetryLevel" = "error";
        "update.mode" = "none";

        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.openRepositoryInParentFolders" = "always";

        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.formatOnType" = true;
        "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;

        "python.analysis.typeCheckingMode" = "strict";
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        "nix.hiddenLanguageServerErrors" = [
          "textDocument/definition"
          "textDocument/formatting"
        ];

        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };
      };

      extensions = with pkgs.vscode-marketplace; [
        ms-vscode-remote.remote-ssh
        ms-vscode.vscode-serial-monitor

        mkhl.direnv
        usernamehw.errorlens

        jnoortheen.nix-ide
        ms-python.python
        ms-python.black-formatter
        rust-lang.rust-analyzer
        ms-vscode.cpptools-extension-pack
        theqtcompany.qt-core
        theqtcompany.qt-qml
        mechatroner.rainbow-csv
      ];
    };
  };
}
