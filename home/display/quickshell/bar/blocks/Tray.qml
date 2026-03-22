import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

import "../../utils"

RowLayout {
    Repeater {
        model: SystemTray.items

        Block {
            required property SystemTrayItem modelData

            property int blockHeight: bar.height - 2 * margin
            
            color: theme.orange
            Layout.preferredWidth: blockHeight
            Layout.preferredHeight: blockHeight

            Image {
                id: icon
                source: modelData.icon
                fillMode: Image.PreserveAspectFit   
            }
        }
    }
}