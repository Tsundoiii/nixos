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
                return "(No Network)";
            case NetworkConnectivity.Unknown:
                return "(Unknown)";
            case NetworkConnectivity.Portal:
                text += " (Portal)";
                break;
            case NetworkConnectivity.Limited:
                text += " (Limited)";
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
