import QtQuick
import QtQuick.Layouts
import Quickshell

import "blocks"

PanelWindow {
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

        Network {}

        Tray {}
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
