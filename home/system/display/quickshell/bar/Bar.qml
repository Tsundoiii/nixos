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

            Time {
                anchors.centerIn: parent
            }

            RowLayout {
                anchors.fill: parent

                RowLayout {
                    Layout.leftMargin: 5

                    Tray {}

                    Bluetooth {}
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    Layout.rightMargin: 5

                    Hardware {}

                    Network {}

                    Audio {}

                    Battery {}
                }
            }
        }
    }
}