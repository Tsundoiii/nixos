import Quickshell.Services.UPower
import QtQuick
import "utils"

BarBlock {
    property int percent: Math.round(UPower.displayDevice.percentage * 100)
    color: UPower.onBattery ? (percent < 20 ? (percent < 10 ? theme.red : theme.yellow) : theme.green) : theme.disabled(theme.green)
    
    BarText {
        property var batterySymbols: {
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
            return UPower.displayDevice.isLaptopBattery ? `${batterySymbols[parseInt(percent / 10) * 10]} ${percent}% ` : ""
        }

        text: `${batteryPercent(percent)}⏻`
    }
}