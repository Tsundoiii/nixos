import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "blocks"

Scope {
  SystemPalette {
    id: palette
  }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      color: palette.window

      RowLayout {
        anchors.fill: parent

        Workspaces {
          palette: palette
          Layout.alignment: Qt.AlignLeft
        }

        Time {
          palette: palette
          Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
          id: right
          spacing: 20
          Layout.alignment: Qt.AlignRight
          
          Bluetooth {
            palette: palette
          }

          Audio {
            palette: palette
          }

          Power {
            palette: palette
          }
        }
      }
    }
  }
}