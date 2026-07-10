import QtQuick
import Quickshell.Networking

import "../../utils"

Block {
    color: Networking.connectivity === NetworkConnectivity.Full ? theme.yellow : theme.disabled(theme.yellow)

    SystemText {
        id: name
        property NetworkDevice device
        text: `${symbol()} ${text()}`

        function symbol() {
            for (const device of Networking.devices.values) {
                if (device.connected) {
                    this.device = device;

                    if (device.type === DeviceType.Wired) {
                        return "󰈁";
                    } else {
                        return "󰖩";
                    }
                }
            }

            return "";
        }

        function text() {
            let text = "";

            switch (Networking.connectivity) {
            case NetworkConnectivity.None:
                return "(無網絡)";
            case NetworkConnectivity.Unknown:
                return "(未知)";
            case NetworkConnectivity.Portal:
                text += " (入口網)";
                break;
            case NetworkConnectivity.Limited:
                text += " (有限)";
                break;
            }

            for (const network of device.networks.values) {
                if (network.connected) {
                    return network.name + text;
                }
            }
        }
    }
}
