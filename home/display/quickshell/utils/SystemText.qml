import QtQuick

Text {
    color: parent.color.a <= 0.75 ? theme.fg : theme.bg0
    verticalAlignment: Text.AlignVCenter
    fontSizeMode: Text.Fit
    
    font: {
        "family": "DejaVuSansM Nerd Font Mono",
        "bold": true,
        "pixelSize": parent.height / 2
    }
}