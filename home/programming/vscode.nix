{ pkgs, ... }:

let
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
    "nix.hiddenLanguageServerErrors" = [ "textDocument/formatting" ];
    "nix.serverSettings" = {
      "nixd" = {
        "formatting" = {
          "command" = [ "nixfmt" ];
        };
      };
    };
  };

  extensions = with pkgs.vscode-extensions; [
    mkhl.direnv
    usernamehw.errorlens
  ];
in
{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        inherit userSettings;

        extensions =
          extensions
          ++ (with pkgs.vscode-extensions; [
            ms-vscode-remote.remote-ssh

            jnoortheen.nix-ide
            ms-python.python
            ms-python.black-formatter
            rust-lang.rust-analyzer

            mechatroner.rainbow-csv
          ]);
      };

      psr = {
        inherit userSettings;

        extensions =
          extensions
          ++ (with pkgs.vscode-extensions; [
            ms-vscode.cpptools
          ]);
      };
    };
  };
}
