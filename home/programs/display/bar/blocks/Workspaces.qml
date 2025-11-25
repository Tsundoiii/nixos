import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "utils"

RowLayout {
    required property SystemPalette palette
    property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
    
    spacing: 20

    Repeater {
        model: Hyprland.workspaces

        BarBlock {
            palette: palette
            
            BarText {
                text: index + 1
            }
        }
    }
}