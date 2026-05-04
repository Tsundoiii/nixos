import QtQuick
import Quickshell.Services.UPower

import "../../utils"

Block {
    property int percent: Math.round(UPower.displayDevice.percentage * 100)

    visible: UPower.displayDevice.isLaptopBattery
    color: UPower.onBattery ? (percent <= 20 ? (percent <= 10 ? theme.red : theme.yellow) : theme.green) : theme.disabled(theme.green)
    
    SystemText {
        property var symbols: {
            0: "󰂎",
            10: "󰁺",
            20: "󰁻",
            30: "󰁼",
            40: "󰁽",
            50: "󰁾",
            60: "󰁿",
            70: "󰂀",
            80: "󰂁",
            90: "󰂂",
            100: "󰁹"
        }

        function batteryPercent(percent: int): string {
            return `${symbols[parseInt(percent / 10) * 10]} ${percent}%`
        }

        text: batteryPercent(percent)
    }
}
