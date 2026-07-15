{ pkgs, lib, ... }:

let
  picoFixed = pkgs.vscode-marketplace.paulober.pico-w-go.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [
      pkgs.autoPatchelfHook
    ];

    buildInputs = (old.buildInputs or [ ]) ++ [
      pkgs.stdenv.cc.cc
    ];

    postFixup = ''
      echo "Fixing pico-w-go native modules..."

      # 1. Remove musl binaries (they will NEVER work on NixOS/glibc)
      find $out -name '*musl.node' -delete || true

      # 2. Patch ALL remaining .node files recursively
      find $out -name '*.node' -print0 | while IFS= read -r -d \'\' f; do
        echo "patching $f"

        patchelf \
          --set-rpath ${
            pkgs.lib.makeLibraryPath [
              pkgs.stdenv.cc.cc
            ]
          } \
          "$f" || true
      done
    '';
  });
in
{
  programs.vscode = {
    enable = true;

    argvSettings = {
      enable-crash-reporter = true;
      crash-reporter-id = "8fda5cae-0e3d-4fd9-a983-8a584b6c53ea";
      password-store = "gnome-libsecret";
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
        "qt-qml.doNotAskForQmllsDownload" = true;
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

        "cmake.cmakePath" = lib.getExe pkgs.cmake;

        "raspberry-pi-pico.cmakePath" = lib.getExe pkgs.cmake;
        "raspberry-pi-pico.python3Path" = lib.getExe pkgs.python3;
        "raspberry-pi-pico.ninjaPath" = lib.getExe pkgs.ninja;
        "raspberry-pi-pico.gitPath" = lib.getExe pkgs.git;
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

        raspberry-pi.raspberry-pi-pico
        picoFixed
        marus25.cortex-debug
        mcu-debug.debug-tracker-vscode
        mcu-debug.memory-view
        mcu-debug.rtos-views
        mcu-debug.peripheral-viewer
      ];
    };
  };
}
