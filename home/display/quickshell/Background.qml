import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "utils"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData

            WlrLayershell.layer: WlrLayer.Background
            anchors: [true, true, true, true]

            implicitWidth: modelData.width
            implicitHeight: modelData.height

            Image {
                anchors.fill: parent
                
                id: picture
                fillMode: Image.PreserveAspectCrop

                SystemText {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    id: explanation
                    font.pixelSize: 12
                    padding: 15
                    color: theme.fg
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }

                function getAPOD(callback) {
                    const xhr = new XMLHttpRequest()
                    xhr.open("GET", "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&thumbs=True")

                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            console.log(xhr.responseText)
                            callback(JSON.parse(xhr.responseText))
                        }
                    }

                    xhr.send()
                }

                function setBackground(response) {
                    if (response.hasOwnProperty("thumbnail_url")) {
                        picture.source = response.thumbnail_url
                    } else if (response.hasOwnProperty("hdurl")) {
                        picture.source = response.hdurl
                    } else {
                        picture.source = response.url
                    }
                    
                    picture.visible = true
                    explanation.text = response.explanation
                }

                Component.onCompleted: { getAPOD(setBackground) }
            }
        }
    }
}