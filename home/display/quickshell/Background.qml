import QtQuick
import Quickshell
import Quickshell.Wayland

import "utils"

PanelWindow {
    id: background
    required property ShellScreen monitor

    screen: monitor
    WlrLayershell.layer: WlrLayer.Background
    anchors: [true, true, true, true]

    implicitWidth: monitor.width
    implicitHeight: monitor.height
    color: "transparent"

    Image {
        id: picture
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        SystemText {
            id: explanation
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            padding: 15
            color: theme.fg
            wrapMode: Text.WordWrap

            font: {
                "family": "FiraCode Nerd Font",
                "bold": true,
                "pixelSize": 12
            }
        }

        function getAPOD(callback) {
            const xhr = new XMLHttpRequest();
            let url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY";

            if (background.monitor.name === "VGA-1") {
                const now = new Date();
                const currentYear = now.getFullYear();
                const startYear = now.getMonth() >= 5 ? 1995 : 1996;
                let year = Math.random() * (currentYear - startYear);

                if (now.getMonth() === 1 && now.getDate() === 29) {
                    year = Math.round(year / 4) * 4;
                }

                year += startYear;
                now.setFullYear(year);
                url += `&date=${Qt.formatDate(now, "yyyy-MM-dd")}`;
            }

            xhr.open("GET", url);

            xhr.onreadystatechange = function () {
                if (xhr.status != 200) {
                    console.error(`APOD retrieval failed with error ${xhr.status}`);
                    return;
                }

                if (xhr.readyState === XMLHttpRequest.DONE) {
                    callback(JSON.parse(xhr.responseText));
                }
            };

            //xhr.send();
        }

        function setBackground(response) {
            if (response.hasOwnProperty("hdurl")) {
                picture.source = response.hdurl;
            } else {
                picture.source = response.url;
            }

            background.visible = true;
            explanation.text = response.explanation;

            if (response.date.slice(0, 4) != new Date().getFullYear()) {
                explanation.text = response.date + `\n${explanation.text}`;
            }
        }

        Component.onCompleted: getAPOD(setBackground)
    }
}
