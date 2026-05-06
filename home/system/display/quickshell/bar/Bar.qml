import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import "blocks"
import "../utils"

Scope {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData

            id: bar
            color: theme.bg0
            implicitHeight: 40

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                
                anchors.leftMargin: 5

                Tray {}

                Network {}
            }

            Time {
                anchors.centerIn: parent
            }

            RowLayout {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                anchors.rightMargin: 5

                Hardware {}

                Audio {}

                Battery {}
            }
        }
    }
}