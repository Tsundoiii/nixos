import QtQuick
import Quickshell.Services.Pipewire

import "../../utils"

Block {
    property PwNode sink: Pipewire.defaultAudioSink

    color: sink.audio.muted ? theme.disabled(theme.aqua) : theme.aqua

    PwObjectTracker { 
        objects: [sink]
    }
    
    SystemText {
        function symbol(sink: PwNode): string {
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

        text: `${symbol(sink)} ${Math.round(sink?.audio.volume * 100)}%`
    }
}