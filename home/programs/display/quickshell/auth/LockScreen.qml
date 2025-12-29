import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../utils"

Rectangle {
    readonly property var theme: SystemTheme.theme
    required property var auth
    property string errorText: ""

    anchors.fill: parent
    color: theme.bg0

    ColumnLayout {
        anchors.centerIn: parent

        TextField {
            id: password
            Layout.alignment: Qt.AlignHCenter
            color: theme.fg
            focus: true
            echoMode: TextInput.Password
            inputMethodHints: Qt.ImhHiddenText

            background: Block {
                color: theme.bg5
                margin: 0
            }

            onAccepted: auth.authenticate(text)
        }

        SystemText {
            text: errorText
            color: theme.fg
        }
    }

    function displayError(error) {
        errorText = `Error: ${error}`
    }
}