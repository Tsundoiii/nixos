import Quickshell
import Quickshell.Services.Greetd
import QtQuick

ShellRoot {
    QtObject {
        id: greetd

        function authenticate(password) {
            Greetd.launch(["hyprland"]);
        }
    }

    LockScreen {
        id: lockScreen
        auth: greetd
    }
}
