import QtQuick
import Quickshell

import "../../utils"

Block {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    SystemText {
        property string dayOfWeek: Qt.formatDate(clock.date, Qt.locale('zh'), Locale.LongFormat).slice(-1)

        text: Qt.formatDateTime(clock.date, `yyyy年M月d日 (${dayOfWeek}) • hh:mm t`)
    }
}
