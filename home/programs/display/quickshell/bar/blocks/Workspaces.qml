import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../../utils"

RowLayout {
    spacing: 0

    Repeater {
        model: Hyprland.workspaces

        Block {
            required property HyprlandWorkspace modelData

            color: modelData.focused || mouseArea.containsMouse ? theme.blue : "transparent"
            implicitWidth: implicitHeight
            margin: 2
            
            SystemText {
                palette: palette
                text: modelData.id
                font.bold: modelData.focused
                color: modelData.focused || mouseArea.containsMouse ? theme.bg0 : theme.fg
                horizontalAlignment: Text.AlignHCenter

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: modelData.activate()
                }
            }
        }
    }
}