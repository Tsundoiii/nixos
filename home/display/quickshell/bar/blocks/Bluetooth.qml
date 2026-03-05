import Quickshell.Bluetooth
import QtQuick
import "../../utils"

Block {
    visible: Bluetooth.devices.values.some(device => device.connected)
    color: theme.yellow

    SystemText {
        property var batterySymbols: {
            10: "󰤾",
            20: "󰤿",
            30: "󰥀",
            40: "󰥁",
            50: "󰥂",
            60: "󰥃",
            70: "󰥄",
            80: "󰥅",
            90: "󰥆",
            100: "󰥈"
        }

        function deviceInfo(device: BluetoothDevice): string {
            const batteryPercent = Math.round(device.battery * 100)
            
            return `󰂯 ${device.name} ${batterySymbols[parseInt(batteryPercent / 10) * 10]} ${batteryPercent}%`
        }

        text: deviceInfo(Bluetooth.devices.values[0])
    }
}