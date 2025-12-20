import Quickshell
import QtQuick
import "utils"

BarBlock {
    BarText {
        text: Qt.formatDateTime(clock.date, "ddd • MMM d • hh:mm t")
    }
}
