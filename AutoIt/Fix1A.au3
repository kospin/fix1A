#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>


; Run Notepad
Run("notepad.exe " & $CmdLine[1])
; Wait for the Notepad to become active. The classname "Notepad" is monitored instead of the window title
WinWaitActive("[CLASS:Notepad]")

; Now that the Notepad window is active type some text
Send("^{END}")
Send("+{LEFT}")
local $tmpClip=ClipGet()
Send("^c")
local $sClip=ClipGet()
local $aClip=StringToASCIIArray($sClip)

if $aClip[0]=26 then
    Send("+{BS 2}")
    Send("^{s}")
endif
; Now quit by pressing Alt-F 
Send("!f")
Sleep(10)
Send("x")
WinWaitClose("[CLASS:Notepad]")
ClipPut($tmpClip)