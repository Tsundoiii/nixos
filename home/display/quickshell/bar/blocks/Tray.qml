import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

import "../../utils"

RowLayout {
    Repeater {
        model: SystemTray.items

        Block {
            required property SystemTrayItem modelData

            color: theme.orange

            RowLayout {
                Image {
                    id: icon
                    source: modelData.icon
                    fillMode: Image.PreserveAspectFit
                    Layout.preferredWidth: bar.height / 2
                    Layout.preferredHeight: bar.height / 2
                }

                SystemText {
                    text: modelData.tooltipDescription
                    visible: text
                }
            }
        }
    }
}
