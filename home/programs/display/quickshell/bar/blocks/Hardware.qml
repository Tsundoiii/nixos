import Quickshell.Io
import QtQuick
import "../../utils"

Block {
    color: theme.purple

    SystemText {
        property int cpu
        property int mem
        id: t
        text: `󰍛 ${cpu}%  ${mem}%`

        Process {
            id: cpuProc
            command: ["sh", "-c", "head -1 /proc/stat"]
            stdout: SplitParser {
                onRead: data => {
                    if (!data) return
                    var p = data.trim().split(/\s+/)
                    var idle = parseInt(p[4]) + parseInt(p[5])
                    var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                    t.cpu = Math.round(100 * (1 - (idle) / (total)))
                    
                }
            }
            Component.onCompleted: running = true
        }

        Process {
            id: memProc
            command: ["sh", "-c", "free | grep Mem"]
            stdout: SplitParser {
                onRead: data => {
                    if (!data) return
                    var parts = data.trim().split(/\s+/)
                    var total = parseInt(parts[1]) || 1
                    var used = parseInt(parts[2]) || 0
                    var memUsage = Math.round(100 * used / total)
                    t.mem = memUsage
                }
            }
            Component.onCompleted: running = true
        }

        Timer {
            interval: 2000
            running: true
            repeat: true
            onTriggered: {
                cpuProc.running = true
                memProc.running = true
            }
        }
    }
}