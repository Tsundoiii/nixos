import QtQuick

Text {
    color: parent.color.a <= 0.75 ? theme.fg : theme.bg0
    font: {
        "family": "DejaVuSansM Nerd Font Mono",
        "bold": true
    }
}