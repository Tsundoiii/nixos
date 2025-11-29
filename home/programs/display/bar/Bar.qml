import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "blocks"

Scope {
  SystemPalette {
    id: palette
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: bar
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
          
          Bluetooth {}

          Audio {}

          Power {}
        }
      }
    }
  }
}