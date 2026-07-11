{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    argvSettings = {
      enable-crash-reporter = true;
      crash-reporter-id = "8fda5cae-0e3d-4fd9-a983-8a584b6c53ea";
      locale = "zh-tw";
    };

    profiles.default = {
      userSettings = {
        "terminal.integrated.initialHint" = false;
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
        "editor.fontLigatures" = "'calt' 0, 'ss04'";

        "workbench.secondarySideBar.defaultVisibility" = "hidden";
        "workbench.editorAssociations" = {
          "{git,gitlens,chat-editing-snapshot-text-model,copilot,git-graph,git-graph-3}:/**/*.qrc" =
            "default";
          "*.qrc" = "qt-core.qrcEditor";
        };

        "qt-core.showWelcomePageOnActivation" = false;

        "qt-qml.qmlls.customExePath" = lib.getExe' pkgs.kdePackages.qtdeclarative "qmlls";
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;
        "qt-qml.qmlls.customArgs" = [ "-E" ];

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };
        "nix.hiddenLanguageServerErrors" = [
          "textDocument/definition"
          "textDocument/formatting"
        ];
      };

      extensions = with pkgs.vscode-marketplace; [
        ms-ceintl.vscode-language-pack-zh-hant

        ms-vscode-remote.remote-ssh
        ms-vscode.vscode-serial-monitor

        datakurre.devenv
        usernamehw.errorlens

        jnoortheen.nix-ide
        ms-python.python
        ms-python.black-formatter
        rust-lang.rust-analyzer
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools
        ms-vscode.cmake-tools

        myriad-dreamin.tinymist
        theqtcompany.qt-core
        theqtcompany.qt-qml
        tamasfe.even-better-toml
        mechatroner.rainbow-csv
        myriad-dreamin.tinymist
      ];
    };
  };
}
