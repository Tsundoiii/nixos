import Quickshell.Services.UPower
import QtQuick
import "utils"

BarBlock {
    color: UPower.onBattery ? "transparent" : "#83c092"
    
    BarText {
        property var batterySymbols: {
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

        property int percent: Math.round(UPower.displayDevice.percentage * 100)

        function batteryPercent(percent: int): string {
            return UPower.displayDevice.isLaptopBattery ? `${batterySymbols[parseInt(percent / 10) * 10]} ${percent}% ` : ""
        }

        palette: palette
        text: `${batteryPercent(percent)}⏻`
    }
}