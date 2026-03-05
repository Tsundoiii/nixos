import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import "../../utils"

RowLayout {
    Repeater {
        model: SystemTray.items

        Block {
            required property SystemTrayItem modelData
            
            color: theme.orange
            Layout.preferredWidth: bar.height - 2 * margin
            Layout.preferredHeight: bar.height - 2 * margin

            Image {
                id: icon
                source: modelData.icon
                fillMode: Image.PreserveAspectFit   
            }
        }
    }
}