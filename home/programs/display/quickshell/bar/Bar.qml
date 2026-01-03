import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "blocks"
import "../utils"

Scope {
    readonly property var theme: SystemTheme.theme

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData

            id: bar

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            color: theme.bg0

            RowLayout {
                anchors.fill: parent

                Workspaces {
                    Layout.alignment: Qt.AlignLeft
                    Layout.margins: (bar.height - height) / 2
                }

                Time {
                    anchors.centerIn: parent
                    Layout.margins: (bar.height - height) / 2
                }

                RowLayout {
                    id: right
                    Layout.alignment: Qt.AlignRight
                    Layout.margins: (bar.height - height) / 2

                    Tray {}

                    Bluetooth {}

                    Hardware {}

                    Network {}

                    Audio {}

                    Power {}
                }
            }
        }
    }
}