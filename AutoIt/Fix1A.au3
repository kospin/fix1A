#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

;
; Run Notepad
Func Fix()
    Run("notepad.exe " & $CmdLine[1])
    ; Wait for the Notepad to become active. The classname "Notepad" is monitored instead of the window title
    WinWaitActive("[CLASS:Notepad]")
    
    ; Now that the Notepad window is active type some text
    Send("{CTRLDOWN}{END}{CTRLUP}")
    Send("+{BS 2}")
    Send("{CTRLDOWN}{s}{CTRLUP}")
    ; Now quit by pressing Alt-F 
    Send("!f")
    Sleep(10)
    Send("x")
    WinWaitClose("[CLASS:Notepad]")
EndFunc

Func Test()
    local $hFileOpen = FileOpen($CmdLine[1])
    local $hFileRead = FileRead($hFileOpen)
    FileClose($hFileOpen)
    Local $aArray = StringToASCIIArray($hFileRead)
    if $aArray[UBound($aArray)-1]=26 Then
        Fix()
    EndIf
EndFunc

Test()