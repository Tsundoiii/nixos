import Quickshell

import "bar"
import "utils"

ShellRoot {
    readonly property var theme: SystemTheme.theme

    Variants {
        model: Quickshell.screens

        Scope {
            required property ShellScreen modelData

            Background {
                monitor: modelData
            }
            
            Bar {
                screen: modelData
            }
        }
    }
}