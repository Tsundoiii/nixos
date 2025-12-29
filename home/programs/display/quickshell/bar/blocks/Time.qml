import Quickshell
import QtQuick
import "../../utils"

Block {
    SystemText {
        text: Qt.formatDateTime(clock.date, "ddd • MMM d • hh:mm t")
    }
}
