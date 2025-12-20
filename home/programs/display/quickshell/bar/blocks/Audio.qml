import Quickshell.Services.Pipewire
import QtQuick
import "utils"

BarBlock {
    property PwNode sink: Pipewire.defaultAudioSink

    PwObjectTracker { 
        objects: [sink]
    }

    color: sink.audio.muted ? theme.disabled(theme.purple) : theme.purple
    
    BarText {
        function volumeSymbol(sink: PwNode): string {
            if (sink.audio.muted) {
                return ""
            } else if (sink.audio.volume === 0) {
                return ""
            } else if (sink.audio.volume < 0.5) {
                return ""
            } else {
                return ""
            }
        }

        text: `${volumeSymbol(sink)} ${Math.round(sink?.audio.volume * 100)}%`
    }
}