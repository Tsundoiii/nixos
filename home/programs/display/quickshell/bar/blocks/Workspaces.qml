import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "utils"

RowLayout {
    property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
    
    spacing: 0

    Repeater {
        model: Hyprland.workspaces

        BarBlock {
            required property HyprlandWorkspace modelData
            color: modelData.focused || mouseArea.containsMouse ? theme.blue : "transparent"
            implicitWidth: implicitHeight
            margin: 2
            
            BarText {
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