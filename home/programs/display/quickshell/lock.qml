import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pam
import "auth"

ShellRoot {
    PamContext {
        id: pam
        property string password

        function authenticate(password: string) {
            this.password = password
            this.start()
        }

        onPamMessage: {
            if (this.responseRequired) {
                this.respond(password)
            }
        }

        onCompleted: result => {
            if (result === PamResult.Success) {
                lock.locked = false
                Qt.quit()
            } else {
                lock.lockScreen.displayError(PamResult.toString(result))
            }
        }
    }

    WlSessionLock {
        id: lock
        locked: true
        
        WlSessionLockSurface {
            LockScreen {
                id: lockScreen
                auth: pam
            }
        }
    }
}