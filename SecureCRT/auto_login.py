# $language = "Python"

# $interface = "1.0"
import random

SCRIPT_TAB = crt.GetScriptTab()
SCRIPT_TAB.Screen.Synchronous = True

def main():
  # Display SecureCRT's version
        objConfig = SCRIPT_TAB.Session.Config

        desc = objConfig.GetOption("Description")

        #opt = objConfig.GetOption("Username")
        #crt.Dialog.MessageBox("options" + opt)
        #szSessionName = SCRIPT_TAB.Session.Path
        #crt.Dialog.MessageBox("Username for current session (" +szSessionName + ") = " + desc[0])

        SCRIPT_TAB.Screen.Synchronous = True

        SCRIPT_TAB.Screen.WaitForString("Select server:")

        SCRIPT_TAB.Screen.Send(random.choice('123') + "\n")

        if(SCRIPT_TAB.Screen.WaitForString("bash-4.1$ ", 1) != True):
                SCRIPT_TAB.Screen.Send("\n")
                crt.Sleep(1000)
                SCRIPT_TAB.Screen.WaitForString("bash-4.1$ ") 
        else:
                #crt.Dialog.MessageBox("else")
                crt.Sleep(350)
                #SCRIPT_TAB.Screen.WaitForCursor(1)
                SCRIPT_TAB.Screen.Send("ssh " + desc[0] + chr(13))

        #crt.Sleep(350)
        desc_len = len(desc);
        if(desc_len > 1 and desc[1] != ""):
                SCRIPT_TAB.Screen.WaitForString("password:") 
                #crt.Dialog.MessageBox(desc[1] + chr(13))
                SCRIPT_TAB.Screen.Send(desc[1] + chr(13))

        SCRIPT_TAB.Screen.Synchronous = False

main()
