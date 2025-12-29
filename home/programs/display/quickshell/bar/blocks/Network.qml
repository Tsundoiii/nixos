import Quickshell.Io
import QtQuick
import QtNetwork
import "../../utils"

Block {
    color: NetworkInformation.reachability === NetworkInformation.Reachability.Online ? theme.blue : theme.disabled(theme.blue)

    SystemText {
        property string network

        id: name
        text: `${symbol()} ${text()}`

        function symbol() {
            var symbol

            switch (NetworkInformation.transportMedium) {
                case NetworkInformation.TransportMedium.Ethernet:
                    symbol = "󰈁"
                    break
                case NetworkInformation.TransportMedium.WiFi:
                    symbol = "󰖩"
                    break
                default:
                    symbol = ""
            }

            return symbol
        }

        function text() {
            var text

            switch (NetworkInformation.reachability) {
                case NetworkInformation.Reachability.Online:
                case NetworkInformation.Reachability.Site:
                case NetworkInformation.Reachability.Local:
                    text = network
                    break
                default:
                    text = "(No Network)"
            }

            return text
        }

        Process {
            id: getNetwork
            command: ["sh", "-c", "nmcli -t -f NAME c show --active | head -n 1 | head -c -1"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: name.network = text
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