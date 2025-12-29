import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import "../../utils"

Repeater {
    model: SystemTray.items

    Block {
        required property SystemTrayItem modelData
        
        color: theme.orange

        RowLayout {
            Image {
                source: modelData.icon
                fillMode: Image.PreserveAspectFit
                Layout.preferredHeight: tooltip.height
                Layout.preferredWidth: paintedWidth
            }

            SystemText {
                id: tooltip
                visible: modelData.tooltipDescription
                text: modelData.tooltipDescription
            }

            MouseArea {
                visible: false
                anchors.fill: parent
                onClicked: modelData.activate()
            }
        }
    }
}