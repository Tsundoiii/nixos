import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "blocks"

Scope {
  readonly property var theme: {
    "bg_dim": "#1e2326",
    "bg0": "#272e33",
    "bg1": "#2e383c",
    "bg2": "#374145",
    "bg3": "#414b50",
    "bg4": "#495156",
    "bg5": "#4f5b58",

    "bg_red": "#493b40",
    "bg_yellow": "#45443c",
    "bg_green": "#3c4841",
    "bg_blue": "#384b55",
    "bg_purple": "#463f48",
    "bg_visual": "#4c3743",
    "fg": "#d3c6aa",

    "red": "#e67e80",
    "yellow": "#dbbc7f",
    "green": "#a7c080",
    "blue": "#7fbbb3",
    "purple": "#d699b6",
    "aqua": "#83c092",
    "orange": "#e69875",

    "grey0": "#7a8478",
    "grey1": "#859289",
    "grey2": "#9da9a0",
    "statusline1": this.green,
    "statusline2": this.fg,
    "statusline3": this.red,

    "disabled": function (color) {
      return `#40${color.substring(1)}`
    }
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
          
          Bluetooth {}

          Tray {}

          Hardware {}

          Network {}

          Audio {}

          Power {}
        }
      }
    }
  }
}