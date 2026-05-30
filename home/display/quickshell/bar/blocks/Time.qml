import QtQuick
import Quickshell

import "../../utils"

Block {
    SystemText {
        text: Qt.formatDateTime(clock.date, "ddd • MMM d • h:mm t")
    }
}
