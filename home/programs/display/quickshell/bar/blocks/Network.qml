import Quickshell.Io
import QtQuick
import QtNetwork
import "utils"

BarBlock {
    color: theme.orange

    BarText {
        id: name

        Process {
            id: getNetwork
            command: ["sh", "-c", "nmcli -t -f NAME c show --active | head -n 1 | head -c -1"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: name.text = `${NetworkInformation.transportMedium === NetworkInformation.TransportMedium.Ethernet ? "󰈁" : "󰖩"} ${text}`
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: getNetwork.running = true
        }
    }
}