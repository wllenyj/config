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
        password = "密码"
        username = "用户名"

        SCRIPT_TAB.Screen.Synchronous = True

        SCRIPT_TAB.Screen.WaitForString("Token): ")

        while True:
                token = crt.Dialog.Prompt("Enter your password:", "Logon Script", "", True)
                if token != "":
                        SCRIPT_TAB.Screen.Send(password + token + chr(13))
                else:
                        return

                '''if SCRIPT_TAB.Screen.WaitForString("Username: ", 2) == True:
                        SCRIPT_TAB.Screen.Send(username + chr(13))
                        #crt.Sleep(1)
                        SCRIPT_TAB.Screen.WaitForString("Token): ")
                        continue
                else:
                        break'''
                if SCRIPT_TAB.Screen.WaitForString("$", 2) == True:
                        break
                else:
                        SCRIPT_TAB.Screen.Send(username + chr(13))
                        #crt.Sleep(1)
                        SCRIPT_TAB.Screen.WaitForString("Token): ")

        #crt.Dialog.MessageBox("ssh")
        SCRIPT_TAB.Screen.Send("ssh " + desc[0] + chr(13))
        SCRIPT_TAB.Screen.WaitForString("id_dsa': ")
        SCRIPT_TAB.Screen.Send(password + chr(13))

        SCRIPT_TAB.Screen.Synchronous = False

main()
