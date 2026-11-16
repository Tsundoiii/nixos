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
            linkColor: theme.fg
            wrapMode: Text.WordWrap

            font: {
                "family": "FiraCode Nerd Font",
                "bold": true,
                "pixelSize": 12
            }
        }

        function getAPOD(callback) {
            const xhr = new XMLHttpRequest();
            let url = "https://science.nasa.gov/wp-json/wp/v2/apod-basic/";

            const date = new Date();

            if (background.monitor.name === "VGA-1") {
                const currentYear = date.getFullYear();
                const startYear = date.getMonth() >= 5 ? 1995 : 1996;
                let year = Math.random() * (currentYear - startYear);

                if (date.getMonth() === 1 && date.getDate() === 29) {
                    year = Math.round(year / 4) * 4;
                }

                year += startYear;
                date.setFullYear(year);
            }

            url += Qt.formatDate(date, "yyMMdd");

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

            xhr.send();
        }

        function setBackground(response) {
            background.visible = true;
            picture.source = response.hdurl;
            explanation.text = `${response.date.slice(0, 4) != new Date().getFullYear() ? response.date + "\n": ""}${response.explanation}`;
        }

        Component.onCompleted: getAPOD(setBackground)
    }
}
