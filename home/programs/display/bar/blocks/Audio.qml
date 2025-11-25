import Quickshell.Services.Pipewire
import QtQuick
import "utils"

BarBlock {
    BarText {
        property PwNode sink: Pipewire.defaultAudioSink

        PwObjectTracker { 
            objects: [Pipewire.defaultAudioSink]

            onObjectsChanged: {
                sink = Pipewire.defaultAudioSink

                if (sink?.audio) {
                    sink.audio.volumeChanged.connect(updateVolume)
                }
            }
        }

        function volumeSymbol(sink: PwNode): string {
            if (sink.muted) {
                return ""
            } else if (sink.audio.volume === 0) {
                return ""
            } else if (sink.audio.volume < 0.5) {
                return ""
            } else {
                return ""
            }
        }

        palette: palette
        text: `${volumeSymbol(sink)} ${Math.round(sink?.audio?.volume * 100)}%`
    }
}