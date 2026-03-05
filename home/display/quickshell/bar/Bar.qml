import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
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
            implicitHeight: 40
            color: theme.bg0

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

                    Bluetooth {
                        Layout.preferredHeight: bar.height - 2 * margin
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    Layout.rightMargin: 5

                    Hardware {
                        Layout.preferredHeight: bar.height - 2 * margin
                    }

                    Network {
                        Layout.preferredHeight: bar.height - 2 * margin
                    }

                    Audio {
                        Layout.preferredHeight: bar.height - 2 * margin
                    }

                    Power {
                        Layout.preferredHeight: bar.height - 2 * margin
                    }
                }
            }
        }
    }
}