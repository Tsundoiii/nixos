import QtQuick

Text {
    color: parent?.color?.a <= 0.75 ? theme.fg : theme.bg0
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    fontSizeMode: Text.Fit
    
    font: {
        "family": "Ioskeley Mono NL",
        "bold": true
    }
}