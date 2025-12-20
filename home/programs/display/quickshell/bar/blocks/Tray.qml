import Quickshell
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import "utils"

Repeater {
    model: SystemTray.items

    BarBlock {
        required property SystemTrayItem modelData

        color: theme.yellow

        RowLayout {
            Image {
                source: modelData.icon
                fillMode: Image.PreserveAspectFit
                Layout.preferredHeight: parent.height
                Layout.preferredWidth: paintedWidth
            }

            BarText {
                text: modelData.tooltipDescription

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.activate()
                }
            }

            QsMenuAnchor {
                menu: modelData.menu
            }
        }
    }
}